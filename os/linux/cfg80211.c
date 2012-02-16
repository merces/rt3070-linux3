/****************************************************************************
 * Ralink Tech Inc.
 * Taiwan, R.O.C.
 *
 * (c) Copyright 2009, Ralink Technology, Inc.
 *
 * All rights reserved. Ralink's source code is an unpublished work and the
 * use of a copyright notice does not imply otherwise. This source code
 * contains confidential trade secret material of Ralink Tech. Any attemp
 * or participation in deciphering, decoding, reverse engineering or in any
 * way altering the source code is stricitly prohibited, unless the prior
 * written consent of Ralink Technology, Inc. is obtained.
 ***************************************************************************/

/****************************************************************************

	Abstract:

	All related CRDA (Central Regulatory Domain Agent) function body.

	History:
		1. 2009/09/17	Sample Lin
			(1) Init version.
		2. 2009/10/27	Sample Lin
			(1) Do not use ieee80211_register_hw() to create virtual interface.
				Use wiphy_register() to register nl80211 command handlers.
			(2) Support iw utility.
		2. 2009/11/03	Sample Lin
			(1) Change name MAC80211 to CFG80211.
			(2) Modify CFG80211_OpsSetChannel().
			(3) Move CFG80211_Register()/CFG80211_UnRegister() to open/close.

	Note:
		The feature is supported only in "LINUX" 2.6.28 above.

***************************************************************************/

#include "rt_config.h"

#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,28))
#ifdef RT_CFG80211_SUPPORT

#define RT_CFG80211_DEBUG /* debug use */
#define CFG80211CB			((CFG80211_CB *)(pAd->pCfg80211_CB))


#ifdef RT_CFG80211_DEBUG
#define CFG80211DBG(__Flg, __pMsg)		DBGPRINT(__Flg, __pMsg)
#else
#define CFG80211DBG(__Flg, __pMsg)
#endif // RT_CFG80211_DEBUG //

/* 1 ~ 14 */
#define CFG80211_NUM_OF_CHAN_2GHZ			14

/* 36 ~ 64, 100 ~ 136, 140 ~ 161 */
#define CFG80211_NUM_OF_CHAN_5GHZ			\
							(sizeof(Cfg80211_Chan)-CFG80211_NUM_OF_CHAN_2GHZ)

/*
	Array of bitrates the hardware can operate with
	in this band. Must be sorted to give a valid "supported
	rates" IE, i.e. CCK rates first, then OFDM.

	For HT, assign MCS in another structure, ieee80211_sta_ht_cap.
*/
const struct ieee80211_rate Cfg80211_SupRate[12] = {
	{
		.flags = 0,
		.bitrate = 10,
		.hw_value = 0,
		.hw_value_short = 0,
	},
	{
		.flags = 0,
		.bitrate = 20,
		.hw_value = 1,
		.hw_value_short = 1,
	},
	{
		.flags = 0,
		.bitrate = 55,
		.hw_value = 2,
		.hw_value_short = 2,
	},
	{
		.flags = 0,
		.bitrate = 110,
		.hw_value = 3,
		.hw_value_short = 3,
	},
	{
		.flags = 0,
		.bitrate = 60,
		.hw_value = 4,
		.hw_value_short = 4,
	},
	{
		.flags = 0,
		.bitrate = 90,
		.hw_value = 5,
		.hw_value_short = 5,
	},
	{
		.flags = 0,
		.bitrate = 120,
		.hw_value = 6,
		.hw_value_short = 6,
	},
	{
		.flags = 0,
		.bitrate = 180,
		.hw_value = 7,
		.hw_value_short = 7,
	},
	{
		.flags = 0,
		.bitrate = 240,
		.hw_value = 8,
		.hw_value_short = 8,
	},
	{
		.flags = 0,
		.bitrate = 360,
		.hw_value = 9,
		.hw_value_short = 9,
	},
	{
		.flags = 0,
		.bitrate = 480,
		.hw_value = 10,
		.hw_value_short = 10,
	},
	{
		.flags = 0,
		.bitrate = 540,
		.hw_value = 11,
		.hw_value_short = 11,
	},
};

/* all available channels */
static const UCHAR Cfg80211_Chan[] = {
	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14,

	/* 802.11 UNI / HyperLan 2 */
	36, 38, 40, 44, 46, 48, 52, 54, 56, 60, 62, 64,

	/* 802.11 HyperLan 2 */
	100, 104, 108, 112, 116, 118, 120, 124, 126, 128, 132, 134, 136,

	/* 802.11 UNII */
	140, 149, 151, 153, 157, 159, 161, 165, 167, 169, 171, 173,

	/* Japan */
	184, 188, 192, 196, 208, 212, 216,
};


typedef struct __CFG80211_CB
{
	/* we can change channel/rate information on the fly so we backup them */
	struct ieee80211_supported_band Cfg80211_bands[IEEE80211_NUM_BANDS];
	struct ieee80211_channel *pCfg80211_Channels;
	struct ieee80211_rate *pCfg80211_Rates;

	/* used in wiphy_unregister */
	struct wireless_dev *pCfg80211_Wdev;

	/* used in scan end */
	struct cfg80211_scan_request *pCfg80211_ScanReq;

	/* monitor filter */
	UINT32 MonFilterFlag;
} CFG80211_CB;

/*
	The driver's regulatory notification callback.
*/
static INT32 CFG80211_RegNotifier(
	IN struct wiphy					*pWiphy,
	IN struct regulatory_request	*pRequest);

/*
	Initialize wireless channel in 2.4GHZ and 5GHZ.
*/
static BOOLEAN CFG80211_SupBandInit(
	IN PRTMP_ADAPTER 				pAd,
	IN struct wiphy					*pWiphy);




/* =========================== Private Function ============================== */

/* get RALINK pAd control block in 80211 Ops */
#define MAC80211_PAD_GET(__pAd, __pWiphy)							\
	{																\
		ULONG *__pPriv;												\
		__pPriv = (ULONG *)(wiphy_priv(__pWiphy));					\
		__pAd = (PRTMP_ADAPTER)(*__pPriv);							\
		if (__pAd == NULL)											\
		{															\
			DBGPRINT(RT_DEBUG_ERROR,								\
					("80211> %s but pAd = NULL!", __FUNCTION__));	\
			return -EINVAL;											\
		}															\
	}

/*
========================================================================
Routine Description:
	Set channel.

Arguments:
	pWiphy			- Wireless hardware description
	pChan			- Channel information
	ChannelType		- Channel type

Return Value:
	0				- success
	-x				- fail

Note:
	For iw utility: set channel, set freq

	enum nl80211_channel_type {
		NL80211_CHAN_NO_HT,
		NL80211_CHAN_HT20,
		NL80211_CHAN_HT40MINUS,
		NL80211_CHAN_HT40PLUS
	};
========================================================================
*/
static int CFG80211_OpsSetChannel(
	IN struct wiphy					*pWiphy,
	IN struct ieee80211_channel		*pChan,
	IN enum nl80211_channel_type	ChannelType)
{
	PRTMP_ADAPTER pAd;
	UINT32 ChanId;
	STRING ChStr[5] = { 0 };
#ifdef DOT11_N_SUPPORT
	UCHAR BW_Old;
	BOOLEAN FlgIsChanged;
#endif // DOT11_N_SUPPORT //


	CFG80211DBG(RT_DEBUG_ERROR, ("80211> CFG80211_OpsSetChannel ==>\n"));
	MAC80211_PAD_GET(pAd, pWiphy);

	/* get channel number */
	ChanId = ieee80211_frequency_to_channel(pChan->center_freq);
	CFG80211DBG(RT_DEBUG_ERROR, ("80211> Channel = %d\n", ChanId));
	CFG80211DBG(RT_DEBUG_ERROR, ("80211> ChannelType = %d\n", ChannelType));

#ifdef DOT11_N_SUPPORT
	if (CFG80211CB->pCfg80211_Wdev->iftype != NL80211_IFTYPE_MONITOR)
	{
		/* get channel BW */
		FlgIsChanged = FALSE;
		BW_Old = pAd->CommonCfg.RegTransmitSetting.field.BW;
	
		/* set to new channel BW */
		if (ChannelType == NL80211_CHAN_HT20)
		{
			pAd->CommonCfg.RegTransmitSetting.field.BW = BW_20;
			FlgIsChanged = TRUE;
		}
		else if ((ChannelType == NL80211_CHAN_HT40MINUS) ||
				(ChannelType == NL80211_CHAN_HT40PLUS))
		{
			/* not support NL80211_CHAN_HT40MINUS or NL80211_CHAN_HT40PLUS */
			/* i.e. primary channel = 36, secondary channel must be 40 */
			pAd->CommonCfg.RegTransmitSetting.field.BW = BW_40;
			FlgIsChanged = TRUE;
		} /* End of if */
	
		CFG80211DBG(RT_DEBUG_ERROR, ("80211> New BW = %d\n",
					pAd->CommonCfg.RegTransmitSetting.field.BW));
	
		/* change HT/non-HT mode (do NOT change wireless mode here) */
		if (((ChannelType == NL80211_CHAN_NO_HT) &&
			(pAd->CommonCfg.HT_Disable == 0)) ||
			((ChannelType != NL80211_CHAN_NO_HT) &&
			(pAd->CommonCfg.HT_Disable == 1)))
		{
			if (ChannelType == NL80211_CHAN_NO_HT)
				pAd->CommonCfg.HT_Disable = 1;
			else
				pAd->CommonCfg.HT_Disable = 0;
			/* End of if */
	
			FlgIsChanged = TRUE;
			CFG80211DBG(RT_DEBUG_ERROR, ("80211> HT Disable = %d\n",
						pAd->CommonCfg.HT_Disable));
		} /* End of if */
	}
	else
	{
		/* for monitor mode */
		FlgIsChanged = TRUE;
		pAd->CommonCfg.HT_Disable = 0;
		pAd->CommonCfg.RegTransmitSetting.field.BW = BW_40;
	} /* End of if */

	if (FlgIsChanged == TRUE)
		SetCommonHT(pAd);
	/* End of if */
#endif // DOT11_N_SUPPORT //

	/* switch to the channel */
	sprintf(ChStr, "%d", ChanId);
	if (Set_Channel_Proc(pAd, ChStr) == FALSE)
	{
		CFG80211DBG(RT_DEBUG_ERROR, ("80211> Change channel fail!\n"));
	} /* End of if */

#ifdef DOT11_N_SUPPORT
	if ((CFG80211CB->pCfg80211_Wdev->iftype == NL80211_IFTYPE_STATION) &&
		(FlgIsChanged == TRUE))
	{
		/*
			1. Station mode;
			2. New BW settings is 20MHz but current BW is not 20MHz;
			3. New BW settings is 40MHz but current BW is 20MHz;

			Re-connect to the AP due to BW 20/40 or HT/non-HT change.
		*/
		Set_SSID_Proc(pAd, pAd->CommonCfg.Ssid);
	} /* End of if */
#endif // DOT11_N_SUPPORT //

	if (CFG80211CB->pCfg80211_Wdev->iftype == NL80211_IFTYPE_ADHOC)
	{
		/* update IBSS beacon */
		MlmeUpdateTxRates(pAd, FALSE, 0);
		MakeIbssBeacon(pAd);
		AsicEnableIbssSync(pAd);

		Set_SSID_Proc(pAd, pAd->CommonCfg.Ssid);
	} /* End of if */

	if (CFG80211CB->pCfg80211_Wdev->iftype == NL80211_IFTYPE_MONITOR)
	{
		/* reset monitor mode in the new channel */
		Set_NetworkType_Proc(pAd, "Monitor");
		RTMP_IO_WRITE32(pAd, RX_FILTR_CFG, CFG80211CB->MonFilterFlag);
	} /* End of if */

	return 0;
} /* End of CFG80211_OpsSetChannel */


/*
========================================================================
Routine Description:
	Change type/configuration of virtual interface.

Arguments:
	pWiphy			- Wireless hardware description
	IfIndex			- Interface index
	Type			- Interface type, managed/adhoc/ap/station, etc.
	pFlags			- Monitor flags
	pParams			- Mesh parameters

Return Value:
	0				- success
	-x				- fail

Note:
	For iw utility: set type, set monitor
========================================================================
*/
static int CFG80211_OpsChgVirtualInf(
	IN struct wiphy					*pWiphy,
	IN int							IfIndex,
	IN enum nl80211_iftype			Type,
	IN u32							*pFlags,
	struct vif_params				*pParams)
{
	PRTMP_ADAPTER pAd;
	struct net_device *pNetDev;


	CFG80211DBG(RT_DEBUG_ERROR, ("80211> CFG80211_OpsChgVirtualInf ==>\n"));
	MAC80211_PAD_GET(pAd, pWiphy);

	CFG80211DBG(RT_DEBUG_ERROR, ("80211> Type = %d\n", Type));

	/* sanity check */
#ifdef CONFIG_STA_SUPPORT
	if ((Type != NL80211_IFTYPE_ADHOC) &&
		(Type != NL80211_IFTYPE_STATION) &&
		(Type != NL80211_IFTYPE_MONITOR))
#endif // CONFIG_STA_SUPPORT //
	{
		DBGPRINT(RT_DEBUG_ERROR, ("80211> Wrong interface type %d!\n", Type));
		return -EINVAL;
	} /* End of if */

	/* update interface type */
	pNetDev = __dev_get_by_index(&init_net, IfIndex);
	if (pNetDev == NULL)
		return -ENODEV;
	/* End of if */

	pNetDev->ieee80211_ptr->iftype = Type;

	/* change type */
#ifdef CONFIG_STA_SUPPORT
	if (Type == NL80211_IFTYPE_ADHOC)
		Set_NetworkType_Proc(pAd, "Adhoc");
	else if (Type == NL80211_IFTYPE_STATION)
		Set_NetworkType_Proc(pAd, "Infra");
#if (LINUX_VERSION_CODE > KERNEL_VERSION(2,4,20))
	else if (Type == NL80211_IFTYPE_MONITOR)
	{
		/* set packet filter */
		Set_NetworkType_Proc(pAd, "Monitor");

		if (pFlags != NULL)
		{
			UINT32 Filter;


			RTMP_IO_READ32(pAd, RX_FILTR_CFG, &Filter);

			if (((*pFlags) & NL80211_MNTR_FLAG_FCSFAIL) == NL80211_MNTR_FLAG_FCSFAIL)
				Filter = Filter & (~0x01);
			else
				Filter = Filter | 0x01;
			/* End of if */
	
			if (((*pFlags) & NL80211_MNTR_FLAG_FCSFAIL) == NL80211_MNTR_FLAG_PLCPFAIL)
				Filter = Filter & (~0x02);
			else
				Filter = Filter | 0x02;
			/* End of if */
	
			if (((*pFlags) & NL80211_MNTR_FLAG_CONTROL) == NL80211_MNTR_FLAG_CONTROL)
				Filter = Filter & (~0xFF00);
			else
				Filter = Filter | 0xFF00;
			/* End of if */
	
			if (((*pFlags) & NL80211_MNTR_FLAG_CONTROL) == NL80211_MNTR_FLAG_OTHER_BSS)
				Filter = Filter & (~0x08);
			else
				Filter = Filter | 0x08;
			/* End of if */

			RTMP_IO_WRITE32(pAd, RX_FILTR_CFG, Filter);
			CFG80211CB->MonFilterFlag = Filter;
		} /* End of if */

		return 0; /* not need to set SSID */
	} /* End of if */
#endif // LINUX_VERSION_CODE //

	pAd->StaCfg.bAutoReconnect = TRUE;

	CFG80211DBG(RT_DEBUG_ERROR, ("80211> SSID = %s\n", pAd->CommonCfg.Ssid));
	Set_SSID_Proc(pAd, pAd->CommonCfg.Ssid);
#endif // CONFIG_STA_SUPPORT //

	return 0;
} /* End of CFG80211_OpsChgVirtualInf */


#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,30))
#if defined(AP_SCAN_SUPPORT) || defined(CONFIG_STA_SUPPORT)
/*
========================================================================
Routine Description:
	Request to do a scan. If returning zero, the scan request is given
	the driver, and will be valid until passed to cfg80211_scan_done().
	For scan results, call cfg80211_inform_bss(); you can call this outside
	the scan/scan_done bracket too.

Arguments:
	pWiphy			- Wireless hardware description
	pNdev			- Network device interface
	pRequest		- Scan request

Return Value:
	0				- success
	-x				- fail

Note:
	For iw utility: scan

	struct cfg80211_scan_request {
		struct cfg80211_ssid *ssids;
		int n_ssids;
		struct ieee80211_channel **channels;
		u32 n_channels;
		const u8 *ie;
		size_t ie_len;

	 * @ssids: SSIDs to scan for (active scan only)
	 * @n_ssids: number of SSIDs
	 * @channels: channels to scan on.
	 * @n_channels: number of channels for each band
	 * @ie: optional information element(s) to add into Probe Request or %NULL
	 * @ie_len: length of ie in octets
========================================================================
*/
static int CFG80211_OpsScan(
	IN struct wiphy					*pWiphy,
	IN struct net_device			*pNdev,
	IN struct cfg80211_scan_request *pRequest)
{
	PRTMP_ADAPTER pAd;


	CFG80211DBG(RT_DEBUG_ERROR, ("80211> CFG80211_OpsScan ==>\n"));
	MAC80211_PAD_GET(pAd, pWiphy);

	/* sanity check */
	if (!RTMP_TEST_FLAG(pAd, fRTMP_ADAPTER_INTERRUPT_IN_USE))
	{
		DBGPRINT(RT_DEBUG_TRACE, ("80211> Network is down!\n"));
		return -ENETDOWN;
	} /* End of if */

	if ((pNdev->ieee80211_ptr->iftype != NL80211_IFTYPE_STATION) &&
		(pNdev->ieee80211_ptr->iftype != NL80211_IFTYPE_ADHOC))
	{
		return -EOPNOTSUPP;
	} /* End of if */

	if (pAd->FlgCfg80211Scanning == TRUE)
		return -EBUSY; /* scanning */
	/* End of if */

	/* do scan */
	pAd->FlgCfg80211Scanning = TRUE;
	CFG80211CB->pCfg80211_ScanReq = pRequest; /* used in scan end */

	rt_ioctl_siwscan(pNdev, NULL, NULL, NULL);
	return 0;
} /* End of CFG80211_OpsScan */
#endif // AP_SCAN_SUPPORT || CONFIG_STA_SUPPORT //
#endif // LINUX_VERSION_CODE //


#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,31))
/*
========================================================================
Routine Description:
	Join the specified IBSS (or create if necessary). Once done, call
	cfg80211_ibss_joined(), also call that function when changing BSSID due
	to a merge.

Arguments:
	pWiphy			- Wireless hardware description
	pNdev			- Network device interface
	pParams			- IBSS parameters

Return Value:
	0				- success
	-x				- fail

Note:
	For iw utility: ibss join

	No fixed-freq and fixed-bssid support.
========================================================================
*/
static int CFG80211_OpsJoinIbss(
	IN struct wiphy					*pWiphy,
	IN struct net_device			*pNdev,
	IN struct cfg80211_ibss_params	*pParams)
{
	PRTMP_ADAPTER pAd;

	CFG80211DBG(RT_DEBUG_ERROR, ("80211> CFG80211_OpsJoinIbss ==>\n"));
	MAC80211_PAD_GET(pAd, pWiphy);

	CFG80211DBG(RT_DEBUG_ERROR, ("80211> SSID = %s\n",
				pParams->ssid));
	CFG80211DBG(RT_DEBUG_ERROR, ("80211> Beacon Interval = %d\n",
				pParams->beacon_interval));

	pAd->StaCfg.bAutoReconnect = TRUE;
	pAd->CommonCfg.BeaconPeriod = pParams->beacon_interval;
	Set_SSID_Proc(pAd, pParams->ssid);

	return 0;
} /* End of CFG80211_OpsJoinIbss */


/*
========================================================================
Routine Description:
	Leave the IBSS.

Arguments:
	pSdata			- Wireless hardware description

Return Value:
	0				- success
	-x				- fail

Note:
	For iw utility: ibss leave
========================================================================
*/
static int CFG80211_OpsLeaveIbss(
	IN struct wiphy					*pWiphy,
	IN struct net_device			*pNdev)
{
	PRTMP_ADAPTER pAd;

	CFG80211DBG(RT_DEBUG_ERROR, ("80211> CFG80211_OpsLeaveIbss ==>\n"));
	MAC80211_PAD_GET(pAd, pWiphy);

	pAd->StaCfg.bAutoReconnect = FALSE;
	LinkDown(pAd,FALSE);

	return 0;
} /* End of CFG80211_OpsLeaveIbss */
#endif // LINUX_VERSION_CODE //


static struct cfg80211_ops CFG80211_Ops = {
	.set_channel			= CFG80211_OpsSetChannel,
	.change_virtual_intf	= CFG80211_OpsChgVirtualInf,

#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,30))
#if defined(AP_SCAN_SUPPORT) || defined(CONFIG_STA_SUPPORT)
	.scan					= CFG80211_OpsScan,
#endif // AP_SCAN_SUPPORT || CONFIG_STA_SUPPORT //
#endif // LINUX_VERSION_CODE //

#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,31))
	.join_ibss				= CFG80211_OpsJoinIbss,
	.leave_ibss				= CFG80211_OpsLeaveIbss,
#endif // LINUX_VERSION_CODE //

#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,32))
	.connect				= CFG80211_Connect
	.disconnect				= CFG80211_Disconnect
#endif // LINUX_VERSION_CODE //
};


/*
========================================================================
Routine Description:
	Allocate a wireless device.

Arguments:
	pAd				- WLAN control block pointer
	pDev			- Generic device interface

Return Value:
	wireless device

Note:
========================================================================
*/
static struct wireless_dev *CFG80211_WdevAlloc(
	IN PRTMP_ADAPTER 				pAd,
	struct device					*pDev)
{
	struct wireless_dev *pWdev;
	ULONG *pPriv;


	/*
	 * We're trying to have the following memory layout:
	 *
	 * +------------------------+
	 * | struct wiphy			|
	 * +------------------------+
	 * | pAd pointer			|
	 * +------------------------+
	 */

	pWdev = kzalloc(sizeof(struct wireless_dev), GFP_KERNEL);
	if (pWdev == NULL)
	{
		DBGPRINT(RT_DEBUG_ERROR, ("80211> Wireless device allocation fail!\n"));
		return NULL;
	} /* End of if */

	pWdev->wiphy = wiphy_new(&CFG80211_Ops, sizeof(ULONG *));
	if (pWdev->wiphy == NULL)
	{
		DBGPRINT(RT_DEBUG_ERROR, ("80211> Wiphy device allocation fail!\n"));
		goto LabelErrWiphyNew;
	} /* End of if */

	/* keep pAd pointer */
	pPriv = (ULONG *)(wiphy_priv(pWdev->wiphy));
	*pPriv = (ULONG)pAd;

	set_wiphy_dev(pWdev->wiphy, pDev);
	pWdev->wiphy->max_scan_ssids = MAX_LEN_OF_BSS_TABLE;
	pWdev->wiphy->interface_modes = BIT(NL80211_IFTYPE_STATION) |
							       BIT(NL80211_IFTYPE_ADHOC) |
							       BIT(NL80211_IFTYPE_MONITOR);
	pWdev->wiphy->reg_notifier = CFG80211_RegNotifier;

	/* init channel information */
	CFG80211_SupBandInit(pAd, pWdev->wiphy);

	/* CFG80211_SIGNAL_TYPE_MBM: signal strength in mBm (100*dBm) */
	pWdev->wiphy->signal_type = CFG80211_SIGNAL_TYPE_MBM;

	if (wiphy_register(pWdev->wiphy) < 0)
	{
		DBGPRINT(RT_DEBUG_ERROR, ("80211> Register wiphy device fail!\n"));
		goto LabelErrReg;
	} /* End of if */

	return pWdev;

 LabelErrReg:
	wiphy_free(pWdev->wiphy);

 LabelErrWiphyNew:
	kfree(pWdev);

	return NULL;
} /* End of CFG80211_WdevAlloc */




/* =========================== Global Function ============================== */

/*
========================================================================
Routine Description:
	Register MAC80211 Module.

Arguments:
	pAd				- WLAN control block pointer
	pDev			- Generic device interface
	pNetDev			- Network device

Return Value:
	NONE

Note:
	pDev != pNetDev
	#define SET_NETDEV_DEV(net, pdev)	((net)->dev.parent = (pdev))

	Can not use pNetDev to replace pDev; Or kernel panic.
========================================================================
*/
VOID CFG80211_Register(
	IN PRTMP_ADAPTER 		pAd,
	IN struct device		*pDev,
	IN struct net_device	*pNetDev)
{
	/* allocate MAC80211 structure */
	if (pAd->pCfg80211_CB != NULL)
		return;
	/* End of if */

	pAd->pCfg80211_CB = kmalloc(sizeof(CFG80211_CB), GFP_ATOMIC);
	if (pAd->pCfg80211_CB == NULL)
	{
		DBGPRINT(RT_DEBUG_ERROR, ("80211> Allocate MAC80211 CB fail!\n"));
		return;
	} /* End of if */

	/* allocate wireless device */
	CFG80211CB->pCfg80211_Wdev = CFG80211_WdevAlloc(pAd, pDev);
	if (CFG80211CB->pCfg80211_Wdev == NULL)
	{
		kfree(pAd->pCfg80211_CB);
		pAd->pCfg80211_CB = NULL;
		return;
	} /* End of if */

	/* bind wireless device with net device */
	/* default we are station mode */
	CFG80211CB->pCfg80211_Wdev->iftype = NL80211_IFTYPE_STATION;

	pNetDev->ieee80211_ptr = CFG80211CB->pCfg80211_Wdev;
	SET_NETDEV_DEV(pNetDev, wiphy_dev(CFG80211CB->pCfg80211_Wdev->wiphy));
	CFG80211CB->pCfg80211_Wdev->netdev = pNetDev;
} /* End of CFG80211_Register */


/*
========================================================================
Routine Description:
	UnRegister MAC80211 Module.

Arguments:
	pAd				- WLAN control block pointer
	pNetDev			- Network device

Return Value:
	NONE

Note:
========================================================================
*/
VOID CFG80211_UnRegister(
	IN PRTMP_ADAPTER 		pAd,
	IN struct net_device	*pNetDev)
{
#if defined(AP_SCAN_SUPPORT) || defined(CONFIG_STA_SUPPORT)
	UINT32 BssId;

	/* free channel information for scan table */
	for(BssId=0; BssId<MAX_LEN_OF_BSS_TABLE; BssId++)
	{
		if (pAd->ScanTab.BssEntry[BssId].pCfg80211_Chan != NULL)
			kfree(pAd->ScanTab.BssEntry[BssId].pCfg80211_Chan);
		/* End of if */

		pAd->ScanTab.BssEntry[BssId].pCfg80211_Chan = NULL;
	} /* End of for */
#endif // AP_SCAN_SUPPORT || CONFIG_STA_SUPPORT //

	/* sanity check */
	if (pAd->pCfg80211_CB == NULL)
		return;
	/* End of if */

	/* unregister */
	if (CFG80211CB->pCfg80211_Wdev != NULL)
	{
		DBGPRINT(RT_DEBUG_ERROR, ("80211> unregister/free wireless device\n"));

		/*
			Must unregister, or you will suffer problem when you change
			regulatory domain by using iw.
		*/
		wiphy_unregister(CFG80211CB->pCfg80211_Wdev->wiphy);
		wiphy_free(CFG80211CB->pCfg80211_Wdev->wiphy);
		kfree(CFG80211CB->pCfg80211_Wdev);

		if (CFG80211CB->pCfg80211_Channels != NULL)
			kfree(CFG80211CB->pCfg80211_Channels);
		/* End of if */

		if (CFG80211CB->pCfg80211_Rates != NULL)
			kfree(CFG80211CB->pCfg80211_Rates);
		/* End of if */

		CFG80211CB->pCfg80211_Wdev = NULL;
		CFG80211CB->pCfg80211_Channels = NULL;
		CFG80211CB->pCfg80211_Rates = NULL;

		/* must reset to NULL; or kernel will panic in unregister_netdev */
		pNetDev->ieee80211_ptr = NULL;
		SET_NETDEV_DEV(pNetDev, NULL);
	} /* End of if */

	kfree(pAd->pCfg80211_CB);
	pAd->pCfg80211_CB = NULL;
	pAd->CommonCfg.HT_Disable = 0;
} /* End of CFG80211_UnRegister */


/*
========================================================================
Routine Description:
	Parse and handle country region in beacon from associated AP.

Arguments:
	pAd				- WLAN control block pointer
	pVIE			- Beacon elements
	LenVIE			- Total length of Beacon elements

Return Value:
	NONE

Note:
========================================================================
*/
VOID CFG80211_BeaconCountryRegionParse(
	IN PRTMP_ADAPTER			pAd,
	IN NDIS_802_11_VARIABLE_IEs	*pVIE,
	IN UINT16					LenVIE)
{
	UCHAR *pElement = (UCHAR *)pVIE;
	UINT32 LenEmt;


	while(LenVIE > 0)
	{
		pVIE = (NDIS_802_11_VARIABLE_IEs *)pElement;

		if (pVIE->ElementID == IE_COUNTRY)
		{
			/* send command to do regulation hint only when associated */
			RTEnqueueInternalCmd(pAd, CMDTHREAD_REG_HINT_11D,
								pVIE->data, pVIE->Length);
			break;
		} /* End of if */

		LenEmt = pVIE->Length + 2;

		if (LenVIE <= LenEmt)
			break; /* length is not enough */
		/* End of if */

		pElement += LenEmt;
		LenVIE -= LenEmt;
	} /* End of while */
} /* End of CFG80211_BeaconCountryRegionParse */


/*
========================================================================
Routine Description:
	Hint to the wireless core a regulatory domain from driver.

Arguments:
	pAd				- WLAN control block pointer
	pCountryIe		- pointer to the country IE
	CountryIeLen	- length of the country IE

Return Value:
	NONE

Note:
	Must call the function in kernel thread.
========================================================================
*/
VOID CFG80211_RegHint(
	IN PRTMP_ADAPTER	pAd,
	IN UCHAR			*pCountryIe,
	IN ULONG			CountryIeLen)
{
	CFG80211DBG(RT_DEBUG_ERROR,
			("crda> regulatory domain hint: %c%c\n",
			pCountryIe[0], pCountryIe[1]));

	if ((CFG80211CB->pCfg80211_Wdev == NULL) || (pCountryIe == NULL))
	{
		CFG80211DBG(RT_DEBUG_ERROR, ("crda> regulatory domain hint not support!\n"));
		return;
	} /* End of if */

	/* hints a country IE as a regulatory domain "without" channel/power info. */
//	regulatory_hint(CFG80211CB->pMac80211_Hw->wiphy, pCountryIe);
	regulatory_hint(CFG80211CB->pCfg80211_Wdev->wiphy, pCountryIe);
} /* End of CFG80211_RegHint */


/*
========================================================================
Routine Description:
	Hint to the wireless core a regulatory domain from country element.

Arguments:
	pAd				- WLAN control block pointer
	pCountryIe		- pointer to the country IE
	CountryIeLen	- length of the country IE

Return Value:
	NONE

Note:
	Must call the function in kernel thread.
========================================================================
*/
VOID CFG80211_RegHint11D(
	IN PRTMP_ADAPTER	pAd,
	IN UCHAR			*pCountryIe,
	IN ULONG			CountryIeLen)
{
	if ((CFG80211CB->pCfg80211_Wdev == NULL) || (pCountryIe == NULL))
	{
		CFG80211DBG(RT_DEBUG_ERROR, ("crda> regulatory domain hint not support!\n"));
		return;
	} /* End of if */

	CFG80211DBG(RT_DEBUG_ERROR,
				("crda> regulatory domain hint: %c%c\n",
				pCountryIe[0], pCountryIe[1]));

	/*
		hints a country IE as a regulatory domain "with" channel/power info.
		but if you use regulatory_hint(), it only hint "regulatory domain".
	*/
//	regulatory_hint_11d(CFG80211CB->pMac80211_Hw->wiphy, pCountryIe, CountryIeLen);
	regulatory_hint_11d(CFG80211CB->pCfg80211_Wdev->wiphy, pCountryIe, CountryIeLen);
} /* End of CFG80211_RegHint11D */


/*
========================================================================
Routine Description:
	Apply new regulatory rule.

Arguments:
	pAd				- WLAN control block pointer
	pWiphy			- Wireless hardware description
	pAlpha2			- Regulation domain (2B)

Return Value:
	NONE

Note:
	Can only be called when interface is up.

	For general mac80211 device, it will be set to new power by Ops->config()
	In rt2x00/, the settings is done in rt2x00lib_config().
========================================================================
*/
VOID CFG80211_RegRuleApply(
	IN PRTMP_ADAPTER				pAd,
	IN struct wiphy					*pWiphy,
	IN UCHAR						*pAlpha2)
{
	enum ieee80211_band IdBand;
	struct ieee80211_supported_band *pSband;
	struct ieee80211_channel *pChan;
	RADAR_DETECT_STRUCT	*pRadarDetect;
	UINT32 IdChan, IdPwr, IdReg;
	UINT32 ChanId, RecId, DfsType;
	ULONG IrqFlags;


	CFG80211DBG(RT_DEBUG_ERROR, ("crda> CFG80211_RegRuleApply ==>\n"));

	/* sanity check */
	if (pWiphy == NULL)
	{
		if ((CFG80211CB != NULL) && (CFG80211CB->pCfg80211_Wdev != NULL))
			pWiphy = CFG80211CB->pCfg80211_Wdev->wiphy;
		/* End of if */
	} /* End of if */

	if ((pWiphy == NULL) || (pAlpha2 == NULL))
		return;

	RTMP_IRQ_LOCK(&pAd->irq_lock, IrqFlags);

	/* zero first */
	NdisZeroMemory(pAd->ChannelList,
					MAX_NUM_OF_CHANNELS * sizeof(CHANNEL_TX_POWER));

	/* 2.4GHZ & 5GHz */
	RecId = 0;
	pRadarDetect = &pAd->CommonCfg.RadarDetect;

	/* find the DfsType */
	DfsType = CE;

	if ((pAlpha2[0] != '0') && (pAlpha2[1] != '0'))
	{
		if (pWiphy->bands[IEEE80211_BAND_5GHZ] != NULL)
		{
			for(IdReg=0; ; IdReg++)
			{
				if (ChRegion[IdReg].CountReg[0] == 0x00)
					break;
				/* End of if */
	
				if ((pAlpha2[0] == ChRegion[IdReg].CountReg[0]) &&
					(pAlpha2[1] == ChRegion[IdReg].CountReg[1]))
				{
					DfsType = ChRegion[IdReg].DfsType;
	
					CFG80211DBG(RT_DEBUG_ERROR,
								("crda> find region %c%c, DFS Type %d\n",
								pAlpha2[0], pAlpha2[1], DfsType));
					break;
				} /* End of if */
			} /* End of for */
		} /* End of if */
	} /* End of if */

	for(IdBand=0; IdBand<IEEE80211_NUM_BANDS; IdBand++)
	{
		if (!pWiphy->bands[IdBand])
			continue;
		/* End of if */

		if (IdBand == IEEE80211_BAND_2GHZ)
		{
			CFG80211DBG(RT_DEBUG_ERROR, ("crda> reset chan/power for 2.4GHz\n"));
		}
		else
		{
			CFG80211DBG(RT_DEBUG_ERROR, ("crda> reset chan/power for 5GHz\n"));
		} /* End of if */

		pSband = pWiphy->bands[IdBand];

		for(IdChan=0; IdChan<pSband->n_channels; IdChan++)
		{
			pChan = &pSband->channels[IdChan];
			ChanId = ieee80211_frequency_to_channel(pChan->center_freq);

			if ((pAd->CommonCfg.PhyMode == PHY_11A) ||
				(pAd->CommonCfg.PhyMode == PHY_11AN_MIXED))
			{
				/* 5G-only mode */
				if (ChanId <= CFG80211_NUM_OF_CHAN_2GHZ)
					continue; /* check next */
				/* End of if */
			} /* End of if */

			if ((pAd->CommonCfg.PhyMode != PHY_11A) &&
				(pAd->CommonCfg.PhyMode != PHY_11ABG_MIXED) &&
				(pAd->CommonCfg.PhyMode != PHY_11AN_MIXED) &&
				(pAd->CommonCfg.PhyMode != PHY_11ABGN_MIXED) &&
				(pAd->CommonCfg.PhyMode != PHY_11AGN_MIXED))
			{
				/* 2.5G-only mode */
				if (ChanId > CFG80211_NUM_OF_CHAN_2GHZ)
					continue; /* check next */
				/* End of if */
			} /* End of if */

			if (pChan->flags & IEEE80211_CHAN_DISABLED)
			{
				/* the channel is not allowed in the regulatory domain */
				CFG80211DBG(RT_DEBUG_ERROR,
							("Chan %03d (frq %d):\tnot allowed!\n",
							ChanId, pChan->center_freq));

				/* get next channel information */
				continue;
			} /* End of if */

			for(IdPwr=0; IdPwr<MAX_NUM_OF_CHANNELS; IdPwr++)
			{
				if (ChanId == pAd->TxPower[IdPwr].Channel)
				{
					/* init the channel info. */
					NdisMoveMemory(&pAd->ChannelList[RecId],
									&pAd->TxPower[IdPwr],
									sizeof(CHANNEL_TX_POWER));

					/* keep channel number */
					pAd->ChannelList[RecId].Channel = ChanId;

					/* keep maximum tranmission power */
					pAd->ChannelList[RecId].MaxTxPwr = pChan->max_power;

					/* keep DFS flag */
					if (pChan->flags & IEEE80211_CHAN_RADAR)
						pAd->ChannelList[RecId].DfsReq = TRUE;
					else
						pAd->ChannelList[RecId].DfsReq = FALSE;
					/* End of if */

					/* keep DFS type */
					pAd->ChannelList[RecId].RegulatoryDomain = DfsType;

					/* re-set DFS info. */
					pRadarDetect->RDDurRegion = DfsType;

					if (DfsType == JAP_W53)
						pRadarDetect->DfsSessionTime = 15;
					else if (DfsType == JAP_W56)
						pRadarDetect->DfsSessionTime = 13;
					else if (DfsType == JAP)
						pRadarDetect->DfsSessionTime = 5;
					else if (DfsType == FCC)
					{
						pRadarDetect->DfsSessionTime = 5;
#ifdef DFS_FCC_BW40_FIX
						pRadarDetect->DfsSessionFccOff = 0;
#endif // DFS_FCC_BW40_FIX //
					}
					else if (DfsType == CE)
						pRadarDetect->DfsSessionTime = 13;
					else
						pRadarDetect->DfsSessionTime = 13;
					/* End of if */

					CFG80211DBG(RT_DEBUG_ERROR,
								("Chan %03d (frq %d):\tpower %d dBm, "
								"DFS %d, DFS Type %d\n",
								ChanId, pChan->center_freq, pChan->max_power,
								((pChan->flags & IEEE80211_CHAN_RADAR)?1:0),
								DfsType));

					/* change to record next channel info. */
					RecId ++;
					break;
				} /* End of if */
			} /* End of for */
		} /* End of for */
	} /* End of for */

	pAd->ChannelListNum = RecId;
	RTMP_IRQ_UNLOCK(&pAd->irq_lock, IrqFlags);

	CFG80211DBG(RT_DEBUG_ERROR, ("crda> Number of channels = %d\n", RecId));
} /* End of CFG80211_RegRuleApply */


#if defined(AP_SCAN_SUPPORT) || defined(CONFIG_STA_SUPPORT)
/*
========================================================================
Routine Description:
	Inform us that a scan is got.

Arguments:
	pAd				- WLAN control block pointer

Return Value:
	NONE

Note:
	Call RT_CFG80211_SCANNING_INFORM, not CFG80211_Scaning
========================================================================
*/
VOID CFG80211_Scaning(
	IN PRTMP_ADAPTER				pAd,
	IN UINT32						BssIdx,
	IN UINT32						ChanId,
	IN UCHAR						*pFrame,
	IN UINT32						FrameLen,
	IN INT32						RSSI,
	IN INT32						MemFlag)
{
	struct ieee80211_channel *pChan;


	if (!RTMP_TEST_FLAG(pAd, fRTMP_ADAPTER_INTERRUPT_IN_USE))
	{
		DBGPRINT(RT_DEBUG_TRACE, ("80211> Network is down!\n"));
		return;
	} /* End of if */

	if (pAd->FlgCfg80211Scanning == FALSE)
		return; /* no scan is running */
	/* End of if */

	/* init */
	/* Note: Can not use local variable to do pChan */
	if (pAd->ScanTab.BssEntry[BssIdx].pCfg80211_Chan == NULL)
	{
		pAd->ScanTab.BssEntry[BssIdx].pCfg80211_Chan = \
					kmalloc(sizeof(struct ieee80211_channel), GFP_ATOMIC);
		if (pAd->ScanTab.BssEntry[BssIdx].pCfg80211_Chan == NULL)
		{
			DBGPRINT(RT_DEBUG_ERROR, ("80211> Allocate chan fail!\n"));
			return;
		} /* End of if */
	} /* End of if */

	pChan = pAd->ScanTab.BssEntry[BssIdx].pCfg80211_Chan;
	memset(pChan, 0, sizeof(*pChan));

	if (ChanId > 14)
		pChan->band = IEEE80211_BAND_5GHZ;
	else
		pChan->band = IEEE80211_BAND_2GHZ;
	/* End of if */

	pChan->center_freq = ieee80211_channel_to_frequency(ChanId);

	if (pAd->CommonCfg.PhyMode >= PHY_11ABGN_MIXED)
	{
		if (pAd->CommonCfg.RegTransmitSetting.field.BW == BW_20)
			pChan->max_bandwidth = 20; /* 20MHz */
		else
			pChan->max_bandwidth = 40; /* 40MHz */
		/* End of if */
	}
	else
		pChan->max_bandwidth = 5; /* 5MHz for non-HT device */
	/* End of if */

	/* no use currently in 2.6.30 */
//	if (ieee80211_is_beacon(((struct ieee80211_mgmt *)pFrame)->frame_control))
//		pChan->beacon_found = 1;
	/* End of if */

	/* inform 80211 a scan is got */
	/* we can use cfg80211_inform_bss in 2.6.31, it is easy more than the one */
	/* in cfg80211_inform_bss_frame(), it will memcpy pFrame but pChan */
	cfg80211_inform_bss_frame(CFG80211CB->pCfg80211_Wdev->wiphy,
								pAd->ScanTab.BssEntry[BssIdx].pCfg80211_Chan,
								(struct ieee80211_mgmt *)pFrame,
								FrameLen,
								RSSI,
								MemFlag);
} /* End of CFG80211_ScanEnd */


/*
========================================================================
Routine Description:
	Inform us that scan ends.

Arguments:
	pAd				- WLAN control block pointer
	FlgIsAborted	- 1: scan is aborted

Return Value:
	NONE

Note:
========================================================================
*/
VOID CFG80211_ScanEnd(
	IN PRTMP_ADAPTER				pAd,
	IN BOOLEAN						FlgIsAborted)
{
	if (!RTMP_TEST_FLAG(pAd, fRTMP_ADAPTER_INTERRUPT_IN_USE))
	{
		DBGPRINT(RT_DEBUG_TRACE, ("80211> Network is down!\n"));
		return;
	} /* End of if */

	if (pAd->FlgCfg80211Scanning == FALSE)
		return; /* no scan is running */
	/* End of if */

	if (FlgIsAborted == TRUE)
		FlgIsAborted = 1;
	else
		FlgIsAborted = 0;
	/* End of if */

	cfg80211_scan_done(CFG80211CB->pCfg80211_ScanReq, FlgIsAborted);

	pAd->FlgCfg80211Scanning = FALSE;
} /* End of CFG80211_ScanEnd */
#endif // AP_SCAN_SUPPORT || CONFIG_STA_SUPPORT //




/* =========================== Local Function =============================== */

/*
========================================================================
Routine Description:
	The driver's regulatory notification callback.

Arguments:
	pWiphy			- Wireless hardware description
	pRequest		- Regulatory request

Return Value:
	0

Note:
========================================================================
*/
static INT32 CFG80211_RegNotifier(
	IN struct wiphy					*pWiphy,
	IN struct regulatory_request	*pRequest)
{
	PRTMP_ADAPTER pAd;
	ULONG *pPriv;


	/* sanity check */
	pPriv = (ULONG *)(wiphy_priv(pWiphy));
	pAd = (PRTMP_ADAPTER)(*pPriv);

	if (pAd == NULL)
	{
		DBGPRINT(RT_DEBUG_ERROR, ("crda> reg notify but pAd = NULL!"));
		return 0;
	} /* End of if */

	/*
		Change the band settings (PASS scan, IBSS allow, or DFS) in mac80211
		based on EEPROM.

		IEEE80211_CHAN_DISABLED: This channel is disabled.
		IEEE80211_CHAN_PASSIVE_SCAN: Only passive scanning is permitted
					on this channel.
		IEEE80211_CHAN_NO_IBSS: IBSS is not allowed on this channel.
		IEEE80211_CHAN_RADAR: Radar detection is required on this channel.
		IEEE80211_CHAN_NO_FAT_ABOVE: extension channel above this channel
					is not permitted.
		IEEE80211_CHAN_NO_FAT_BELOW: extension channel below this channel
					is not permitted.
	*/
#ifdef RELASE_EXCLUDE
	if (pWiphy->bands[IEEE80211_BAND_5GHZ])
	{
		struct ieee80211_supported_band *pBand;
		struct ieee80211_channel *pChannel;
		UINT32 IdChan;


		/* RALINK follows DFS rule from upper layer */

		/*
			Atheros Communications Inc. driver/net/wireless/ath9k/regd.c

			Always apply Radar/DFS rules on freq range 5260 MHz - 5700 MHz

			We always enable radar detection/DFS on this frequency range.
			Additionally we also apply on this frequency range:

			- If STA mode does not yet have DFS supports disable active scanning
			- If adhoc mode does not support DFS yet then disable adhoc in the
				frequency.
			- If AP mode does not yet support radar detection/DFS do not allow
				AP mode.

			Step1: Loop all channels of 5GHZ and check if the channel needs DFS
					based on settings in EEPROM.
			Step2: If yes and the channel is not disabled,
					pChannel->flags |=	IEEE80211_CHAN_RADAR |
										IEEE80211_CHAN_NO_IBSS |
										IEEE80211_CHAN_PASSIVE_SCAN;
		 */
		pBand = pWiphy->bands[IEEE80211_BAND_5GHZ];
	
		for(IdChan=0; IdChan<pBand->n_channels; IdChan++)
		{
			pChannel = &pBand->channels[IdChan];

			// TODO: add DFS
		}
	} /* End of if */
#endif // RELASE_EXCLUDE //

	/*
		Change regulatory rule here.

		struct ieee80211_channel {
			enum ieee80211_band band;
			u16 center_freq;
			u8 max_bandwidth;
			u16 hw_value;
			u32 flags;
			int max_antenna_gain;
			int max_power;
			bool beacon_found;
			u32 orig_flags;
			int orig_mag, orig_mpwr;
		};

		In mac80211 layer, it will change flags, max_antenna_gain,
		max_bandwidth, max_power.
	*/

	switch(pRequest->initiator)
	{
		case NL80211_REGDOM_SET_BY_CORE:
			/*
				Core queried CRDA for a dynamic world regulatory domain.
			*/
			CFG80211DBG(RT_DEBUG_ERROR, ("crda> requlation requestion by core: "));
			break;

		case NL80211_REGDOM_SET_BY_USER:
			/*
				User asked the wireless core to set the regulatory domain.
				(when iw, network manager, wpa supplicant, etc.)
			*/
			CFG80211DBG(RT_DEBUG_ERROR, ("crda> requlation requestion by user: "));
			break;

		case NL80211_REGDOM_SET_BY_DRIVER:
			/*
				A wireless drivers has hinted to the wireless core it thinks
				its knows the regulatory domain we should be in.
				(when driver initialization, calling regulatory_hint)
			*/
			CFG80211DBG(RT_DEBUG_ERROR, ("crda> requlation requestion by driver: "));
			break;

		case NL80211_REGDOM_SET_BY_COUNTRY_IE:
			/*
				The wireless core has received an 802.11 country information
				element with regulatory information it thinks we should consider.
				(when beacon receive, calling regulatory_hint_11d)
			*/
			CFG80211DBG(RT_DEBUG_ERROR, ("crda> requlation requestion by country IE: "));
			break;
	} /* End of switch */

	CFG80211DBG(RT_DEBUG_ERROR,
				("%c%c\n", pRequest->alpha2[0], pRequest->alpha2[1]));

	/* only follow rules from user */
	if (pRequest->initiator == NL80211_REGDOM_SET_BY_USER)
	{
		/* keep Alpha2 and we can re-call the function when interface is up */
		pAd->Cfg80211_Alpha2[0] = pRequest->alpha2[0];
		pAd->Cfg80211_Alpha2[1] = pRequest->alpha2[1];

		/* apply the new regulatory rule */
		if (RTMP_TEST_FLAG(pAd, fRTMP_ADAPTER_START_UP))
		{
			/* interface is up */
			CFG80211_RegRuleApply(pAd, pWiphy, pRequest->alpha2);
		}
		else
		{
			CFG80211DBG(RT_DEBUG_ERROR, ("crda> interface is down!\n"));
		} /* End of if */
	} /* End of if */

	return 0;
} /* End of CFG80211_RegNotifier */


/*
========================================================================
Routine Description:
	Initialize wireless channel in 2.4GHZ and 5GHZ.

Arguments:
	pAd				- WLAN control block pointer

Return Value:
	TRUE			- init successfully
	FALSE			- init fail

Note:
	TX Power related:

	1. Suppose we can send power to 15dBm in the board.
	2. A value 0x0 ~ 0x1F for a channel. We will adjust it based on 15dBm/
		54Mbps. So if value == 0x07, the TX power of 54Mbps is 15dBm and
		the value is 0x07 in the EEPROM.
	3. Based on TX power value of 54Mbps/channel, adjust another value
		0x0 ~ 0xF for other data rate. (-6dBm ~ +6dBm)

	Other related factors:
	1. TX power percentage from UI/users;
	2. Maximum TX power limitation in the regulatory domain.
========================================================================
*/
static BOOLEAN CFG80211_SupBandInit(
	IN PRTMP_ADAPTER 				pAd,
	IN struct wiphy					*pWiphy)
{
	struct ieee80211_channel *pChannels;
	struct ieee80211_rate *pRates;
	struct ieee80211_supported_band *pBand;
	UINT32 NumOfChan, NumOfRate;
	UINT32 IdLoop;
	UINT32 CurTxPower;


	/* sanity check */
	if (pAd->RFICType == 0)
		pAd->RFICType = RFIC_24GHZ | RFIC_5GHZ;
	/* End of if */

	CFG80211DBG(RT_DEBUG_ERROR, ("80211> RFICType = %d\n", pAd->RFICType));

	/* init */
	if (pAd->RFICType & RFIC_5GHZ)
		NumOfChan = CFG80211_NUM_OF_CHAN_2GHZ + CFG80211_NUM_OF_CHAN_5GHZ;
	else
		NumOfChan = CFG80211_NUM_OF_CHAN_2GHZ;
	/* End of if */

	if (pAd->CommonCfg.PhyMode == PHY_11B)
		NumOfRate = 4;
	else
		NumOfRate = 4 + 8;
	/* End of if */

	pChannels = kzalloc(sizeof(*pChannels) * NumOfChan, GFP_KERNEL);
	if (!pChannels)
	{
		DBGPRINT(RT_DEBUG_ERROR, ("80211> ieee80211_channel allocation fail!\n"));
		return FALSE;
	} /* End of if */

	CFG80211DBG(RT_DEBUG_ERROR, ("80211> Number of channel = %d\n",
				CFG80211_NUM_OF_CHAN_5GHZ));

	pRates = kzalloc(sizeof(*pRates) * NumOfRate, GFP_KERNEL);
	if (!pRates)
	{
		kfree(pChannels);
		DBGPRINT(RT_DEBUG_ERROR, ("80211> ieee80211_rate allocation fail!\n"));
		return FALSE;
	} /* End of if */

	CFG80211DBG(RT_DEBUG_ERROR, ("80211> Number of rate = %d\n", NumOfRate));

	/* get TX power */
#ifdef SINGLE_SKU
	CurTxPower = pAd->CommonCfg.DefineMaxTxPwr; /* dBm */
#else
	CurTxPower = 0; /* unknown */
#endif // SINGLE_SKU //

	CFG80211DBG(RT_DEBUG_ERROR, ("80211> CurTxPower = %d dBm\n", CurTxPower));

	/* init channel */
	for(IdLoop=0; IdLoop<NumOfChan; IdLoop++)
	{
		pChannels[IdLoop].center_freq = \
					ieee80211_channel_to_frequency(Cfg80211_Chan[IdLoop]);
		pChannels[IdLoop].hw_value = IdLoop;

		if (IdLoop < CFG80211_NUM_OF_CHAN_2GHZ)
			pChannels[IdLoop].max_power = CurTxPower;
		else
			pChannels[IdLoop].max_power = CurTxPower;
		/* End of if */

		pChannels[IdLoop].max_antenna_gain = 0xff;
	} /* End of if */

	/* init rate */
	for(IdLoop=0; IdLoop<NumOfRate; IdLoop++)
		memcpy(&pRates[IdLoop], &Cfg80211_SupRate[IdLoop], sizeof(*pRates));
	/* End of for */

	pBand = &CFG80211CB->Cfg80211_bands[IEEE80211_BAND_2GHZ];
	if (pAd->RFICType & RFIC_24GHZ)
	{
		pBand->n_channels = CFG80211_NUM_OF_CHAN_2GHZ;
		pBand->n_bitrates = NumOfRate;
		pBand->channels = pChannels;
		pBand->bitrates = pRates;

#ifdef DOT11_N_SUPPORT
		/* for HT, assign pBand->ht_cap */
		pBand->ht_cap.ht_supported = true;
		pBand->ht_cap.cap = IEEE80211_HT_CAP_SUP_WIDTH_20_40 |
					       IEEE80211_HT_CAP_SM_PS |
					       IEEE80211_HT_CAP_SGI_40 |
					       IEEE80211_HT_CAP_DSSSCCK40;
		pBand->ht_cap.ampdu_factor = 3; /* 2 ^ 16 */
		pBand->ht_cap.ampdu_density = \
						pAd->CommonCfg.BACapability.field.MpduDensity;

		memset(&pBand->ht_cap.mcs, 0, sizeof(pBand->ht_cap.mcs));
		switch(pAd->CommonCfg.RxStream)
		{
			case 1:
			default:
				pBand->ht_cap.mcs.rx_mask[0] = 0xff;
				break;

			case 2:
				pBand->ht_cap.mcs.rx_mask[0] = 0xff;
				pBand->ht_cap.mcs.rx_mask[1] = 0xff;
				break;

			case 3:
				pBand->ht_cap.mcs.rx_mask[0] = 0xff;
				pBand->ht_cap.mcs.rx_mask[1] = 0xff;
				pBand->ht_cap.mcs.rx_mask[2] = 0xff;
				break;
		} /* End of switch */

		pBand->ht_cap.mcs.tx_params = IEEE80211_HT_MCS_TX_DEFINED;
#endif // DOT11_N_SUPPORT //

		pWiphy->bands[IEEE80211_BAND_2GHZ] = pBand;
	}
	else
	{
		pBand->channels = NULL;
		pBand->bitrates = NULL;
	} /* End of if */

	pBand = &CFG80211CB->Cfg80211_bands[IEEE80211_BAND_5GHZ];
	if (pAd->RFICType & RFIC_5GHZ)
	{
		pBand->n_channels = CFG80211_NUM_OF_CHAN_5GHZ;
		pBand->n_bitrates = NumOfRate - 4;
		pBand->channels = &pChannels[CFG80211_NUM_OF_CHAN_2GHZ];
		pBand->bitrates = &pRates[4];

		/* for HT, assign pBand->ht_cap */
#ifdef DOT11_N_SUPPORT
		/* for HT, assign pBand->ht_cap */
		pBand->ht_cap.ht_supported = true;
		pBand->ht_cap.cap = IEEE80211_HT_CAP_SUP_WIDTH_20_40 |
					       IEEE80211_HT_CAP_SM_PS |
					       IEEE80211_HT_CAP_SGI_40 |
					       IEEE80211_HT_CAP_DSSSCCK40;
		pBand->ht_cap.ampdu_factor = 3; /* 2 ^ 16 */
		pBand->ht_cap.ampdu_density = \
						pAd->CommonCfg.BACapability.field.MpduDensity;

		memset(&pBand->ht_cap.mcs, 0, sizeof(pBand->ht_cap.mcs));
		switch(pAd->CommonCfg.RxStream)
		{
			case 1:
			default:
				pBand->ht_cap.mcs.rx_mask[0] = 0xff;
				break;

			case 2:
				pBand->ht_cap.mcs.rx_mask[0] = 0xff;
				pBand->ht_cap.mcs.rx_mask[1] = 0xff;
				break;

			case 3:
				pBand->ht_cap.mcs.rx_mask[0] = 0xff;
				pBand->ht_cap.mcs.rx_mask[1] = 0xff;
				pBand->ht_cap.mcs.rx_mask[2] = 0xff;
				break;
		} /* End of switch */

		pBand->ht_cap.mcs.tx_params = IEEE80211_HT_MCS_TX_DEFINED;
#endif // DOT11_N_SUPPORT //

		pWiphy->bands[IEEE80211_BAND_5GHZ] = pBand;
	}
	else
	{
		pBand->channels = NULL;
		pBand->bitrates = NULL;
	} /* End of if */

	CFG80211CB->pCfg80211_Channels = pChannels;
	CFG80211CB->pCfg80211_Rates = pRates;

	return TRUE;
} /* End of CFG80211_SupBandInit */


#endif // RT_CFG80211_SUPPORT //
#endif // LINUX_VERSION_CODE //

/* End of crda.c */
