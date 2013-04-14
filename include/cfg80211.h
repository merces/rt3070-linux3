/****************************************************************************
 * Ralink Tech Inc.
 * Taiwan, R.O.C.
 *
 * (c) Copyright 2002, Ralink Technology, Inc.
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

	All MAC80211/CFG80211 Related Structure & Definition.

***************************************************************************/

#ifdef RT_CFG80211_SUPPORT

#define RT_CFG80211_CRDA_REG_RULE_APPLY(__pAd)							\
		if (__pAd->pCfg80211_CB != NULL)								\
			CFG80211_RegRuleApply(__pAd, NULL, __pAd->Cfg80211_Alpha2);

#define RT_CFG80211_SCANNING_INFORM					CFG80211_Scaning


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
	IN struct net_device	*pNetDev);

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
	IN struct net_device	*pNetDev);

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
	IN UINT16					LenVIE);

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
	IN ULONG			CountryIeLen);

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
========================================================================
*/
VOID CFG80211_RegHint11D(
	IN PRTMP_ADAPTER	pAd,
	IN UCHAR			*pCountryIe,
	IN ULONG			CountryIeLen);

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
========================================================================
*/
VOID CFG80211_RegRuleApply(
	IN PRTMP_ADAPTER				pAd,
	IN struct wiphy					*pWiphy,
	IN UCHAR						*pAlpha2);

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
	IN INT32						MemFlag);

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
	IN BOOLEAN						FlgIsAborted);
#endif // AP_SCAN_SUPPORT || CONFIG_STA_SUPPORT //

#else

#define RT_CFG80211_SCANNING_INFORM(__pAd, __pPkt)

#endif // RT_CFG80211_SUPPORT //

/* End of cfg80211.h */
