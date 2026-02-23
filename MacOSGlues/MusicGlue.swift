//
//  MusicGlue.swift
//  Music.app 1.5.5
//  SwiftAutomation.framework 0.1.0
//  `aeglue 'Music.app'`
//


import Foundation
import AppleEvents
import SwiftAutomation


/******************************************************************************/
// Create an untargeted AppData instance for use in App, Con, Its roots,
// and in Application initializers to create targeted AppData instances.

private let _specifierFormatter = SwiftAutomation.SpecifierFormatter(
        applicationClassName: "Music",
        classNamePrefix: "MUS",
        typeNames: [
                0x70416374: "active", // "pAct"
                0x7055524c: "address", // "pURL"
                0x63415044: "AirPlayDevice", // "cAPD"
                0x6b41504f: "AirPlayDevice", // "kAPO"
                0x70415045: "AirPlayEnabled", // "pAPE"
                0x6b415058: "AirPortExpress", // "kAPX"
                0x70416c62: "album", // "pAlb"
                0x70416c41: "albumArtist", // "pAlA"
                0x70414874: "albumDisliked", // "pAHt"
                0x70414c76: "albumFavorited", // "pALv"
                0x6b416c62: "albumListing", // "kAlb"
                0x70416c52: "albumRating", // "pAlR"
                0x7041526b: "albumRatingKind", // "pARk"
                0x6b536841: "albums", // "kShA"
                0x6b53724c: "albums", // "kSrL"
                0x616c6973: "alias", // "alis"
                0x6b416c6c: "all_", // "kAll"
                0x2a2a2a2a: "anything", // "****"
                0x6b415054: "AppleTV", // "kAPT"
                0x63617070: "application", // "capp"
                0x62756e64: "applicationBundleID", // "bund"
                0x7369676e: "applicationSignature", // "sign"
                0x6170726c: "applicationURL", // "aprl"
                0x61707220: "April", // "apr "
                0x70417274: "artist", // "pArt"
                0x6b537252: "artists", // "kSrR"
                0x63417274: "artwork", // "cArt"
                0x61736b20: "ask", // "ask "
                0x6b414344: "audioCD", // "kACD"
                0x63434450: "audioCDPlaylist", // "cCDP"
                0x63434454: "audioCDTrack", // "cCDT"
                0x61756720: "August", // "aug "
                0x70417661: "available", // "pAva"
                0x70455131: "band1", // "pEQ1"
                0x70455130: "band10", // "pEQ0"
                0x70455132: "band2", // "pEQ2"
                0x70455133: "band3", // "pEQ3"
                0x70455134: "band4", // "pEQ4"
                0x70455135: "band5", // "pEQ5"
                0x70455136: "band6", // "pEQ6"
                0x70455137: "band7", // "pEQ7"
                0x70455138: "band8", // "pEQ8"
                0x70455139: "band9", // "pEQ9"
                0x62657374: "best", // "best"
                0x70425274: "bitRate", // "pBRt"
                0x6b415042: "BluetoothDevice", // "kAPB"
                0x70426b74: "bookmark", // "pBkt"
                0x70426b6d: "bookmarkable", // "pBkm"
                0x626d726b: "bookmarkData", // "bmrk"
                0x626f6f6c: "boolean", // "bool"
                0x71647274: "boundingRectangle", // "qdrt"
                0x70626e64: "bounds", // "pbnd"
                0x7042504d: "bpm", // "pBPM"
                0x63427257: "browserWindow", // "cBrW"
                0x63617061: "capacity", // "capa"
                0x63617365: "case_", // "case"
                0x70436174: "category", // "pCat"
                0x6b434469: "cdInsert", // "kCDi"
                0x70636c73: "class_", // "pcls"
                0x68636c62: "closeable", // "hclb"
                0x70436c53: "cloudStatus", // "pClS"
                0x70575368: "collapseable", // "pWSh"
                0x77736864: "collapsed", // "wshd"
                0x6c77636c: "collating", // "lwcl"
                0x636c7274: "colorTable", // "clrt"
                0x70436d74: "comment", // "pCmt"
                0x70416e74: "compilation", // "pAnt"
                0x70436d70: "composer", // "pCmp"
                0x6b537243: "composers", // "kSrC"
                0x6b527443: "computed", // "kRtC"
                0x6b415043: "computer", // "kAPC"
                0x656e756d: "constant", // "enum"
                0x63746e72: "container", // "ctnr"
                0x70436e76: "converting", // "pCnv"
                0x6c776370: "copies", // "lwcp"
                0x70415044: "currentAirPlayDevices", // "pAPD"
                0x70456e63: "currentEncoder", // "pEnc"
                0x70455150: "currentEQPreset", // "pEQP"
                0x70506c61: "currentPlaylist", // "pPla"
                0x70537454: "currentStreamTitle", // "pStT"
                0x70537455: "currentStreamURL", // "pStU"
                0x7054726b: "currentTrack", // "pTrk"
                0x70566973: "currentVisual", // "pVis"
                0x74646173: "dashStyle", // "tdas"
                0x74647461: "data", // "tdta"
                0x70504354: "data_", // "pPCT"
                0x70444944: "databaseID", // "pDID"
                0x6c647420: "date", // "ldt "
                0x70416464: "dateAdded", // "pAdd"
                0x64656320: "December", // "dec "
                0x6465636d: "decimalStruct", // "decm"
                0x70446573: "description_", // "pDes"
                0x6c776474: "detailed", // "lwdt"
                0x64696163: "diacriticals", // "diac"
                0x70447343: "discCount", // "pDsC"
                0x7044734e: "discNumber", // "pDsN"
                0x70486174: "disliked", // "pHat"
                0x6b537256: "displayed", // "kSrV"
                0x636f6d70: "doubleInteger", // "comp"
                0x70446c41: "downloaded", // "pDlA"
                0x70444149: "downloaderAccount", // "pDAI"
                0x70444e6d: "downloaderName", // "pDNm"
                0x6b447570: "duplicate", // "kDup"
                0x70447572: "duration", // "pDur"
                0x656e626c: "enabled", // "enbl"
                0x656e6373: "encodedString", // "encs"
                0x63456e63: "encoder", // "cEnc"
                0x6c776c70: "endingPage", // "lwlp"
                0x70457044: "episodeID", // "pEpD"
                0x7045704e: "episodeNumber", // "pEpN"
                0x45505320: "EPSPicture", // "EPS "
                0x70455170: "EQ", // "pEQp"
                0x70455120: "EQEnabled", // "pEQ "
                0x63455150: "EQPreset", // "cEQP"
                0x63455157: "EQWindow", // "cEQW"
                0x6b457272: "error", // "kErr"
                0x6c776568: "errorHandling", // "lweh"
                0x65787061: "expansion", // "expa"
                0x6b505346: "fastForwarding", // "kPSF"
                0x704c6f76: "favorited", // "pLov"
                0x6661786e: "faxNumber", // "faxn"
                0x66656220: "February", // "feb "
                0x66737266: "fileRef", // "fsrf"
                0x63466c54: "fileTrack", // "cFlT"
                0x6675726c: "fileURL", // "furl"
                0x70537470: "finish", // "pStp"
                0x66697864: "fixed", // "fixd"
                0x70466978: "fixedIndexing", // "pFix"
                0x66706e74: "fixedPoint", // "fpnt"
                0x66726374: "fixedRectangle", // "frct"
                0x6b537046: "folder", // "kSpF"
                0x63466f50: "folderPlaylist", // "cFoP"
                0x70466d74: "format", // "pFmt"
                0x66727370: "freeSpace", // "frsp"
                0x66726920: "Friday", // "fri "
                0x70697366: "frontmost", // "pisf"
                0x70465363: "fullScreen", // "pFSc"
                0x7047706c: "gapless", // "pGpl"
                0x70476e73: "genius", // "pGns"
                0x6b537047: "Genius", // "kSpG"
                0x7047656e: "genre", // "pGen"
                0x47494666: "GIFPicture", // "GIFf"
                0x63677478: "graphicText", // "cgtx"
                0x70477270: "grouping", // "pGrp"
                0x6b536847: "groupings", // "kShG"
                0x6b415048: "HomePod", // "kAPH"
                0x68797068: "hyphens", // "hyph"
                0x49442020: "id", // "ID  "
                0x70696478: "index", // "pidx"
                0x6b52656a: "ineligible", // "kRej"
                0x6c6f6e67: "integer", // "long"
                0x69747874: "internationalText", // "itxt"
                0x696e746c: "internationalWritingCode", // "intl"
                0x636f626a: "item", // "cobj"
                0x6b495453: "iTunesStore", // "kITS"
                0x6a616e20: "January", // "jan "
                0x4a504547: "JPEGPicture", // "JPEG"
                0x6a756c20: "July", // "jul "
                0x6a756e20: "June", // "jun "
                0x6b706964: "kernelProcessID", // "kpid"
                0x704b6e64: "kind", // "pKnd"
                0x6c64626c: "largeReal", // "ldbl"
                0x6b53704c: "Library", // "kSpL"
                0x6b4c6962: "library", // "kLib"
                0x634c6950: "libraryPlaylist", // "cLiP"
                0x6c697374: "list", // "list"
                0x704c6f63: "location", // "pLoc"
                0x696e736c: "locationReference", // "insl"
                0x704c6473: "longDescription", // "pLds"
                0x6c667864: "longFixed", // "lfxd"
                0x6c667074: "longFixedPoint", // "lfpt"
                0x6c667263: "longFixedRectangle", // "lfrc"
                0x6c706e74: "longPoint", // "lpnt"
                0x6c726374: "longRectangle", // "lrct"
                0x704c7972: "lyrics", // "pLyr"
                0x6b4d3355: "M3U", // "kM3U"
                0x6b4d3338: "M3U8", // "kM38"
                0x6d616368: "machine", // "mach"
                0x6d4c6f63: "machineLocation", // "mLoc"
                0x706f7274: "machPort", // "port"
                0x6d617220: "March", // "mar "
                0x6b4d6174: "matched", // "kMat"
                0x6d617920: "May", // "may "
                0x704d644b: "mediaKind", // "pMdK"
                0x634d5057: "miniplayerWindow", // "cMPW"
                0x704d6f64: "modifiable", // "pMod"
                0x61736d6f: "modificationDate", // "asmo"
                0x6d6f6e20: "Monday", // "mon "
                0x704d4e6d: "movement", // "pMNm"
                0x704d7643: "movementCount", // "pMvC"
                0x704d764e: "movementNumber", // "pMvN"
                0x6b56644d: "movie", // "kVdM"
                0x6b4d4344: "MP3CD", // "kMCD"
                0x6b53705a: "Music", // "kSpZ"
                0x6b566456: "musicVideo", // "kVdV"
                0x704d7574: "mute", // "pMut"
                0x706e616d: "name", // "pnam"
                0x6b537253: "names", // "kSrS"
                0x704d4143: "networkAddress", // "pMAC"
                0x6e6f2020: "no", // "no  "
                0x6b526576: "noLongerAvailable", // "kRev"
                0x6b4e6f6e: "none", // "kNon"
                0x6b557050: "notUploaded", // "kUpP"
                0x6e6f7620: "November", // "nov "
                0x6e756c6c: "null", // "null"
                0x6e756d65: "numericStrings", // "nume"
                0x6f637420: "October", // "oct "
                0x6b52704f: "off", // "kRpO"
                0x6b527031: "one", // "kRp1"
                0x6c776c61: "pagesAcross", // "lwla"
                0x6c776c64: "pagesDown", // "lwld"
                0x70506c50: "parent", // "pPlP"
                0x6b505370: "paused", // "kPSp"
                0x70504953: "persistentID", // "pPIS"
                0x50494354: "picture", // "PICT"
                0x74706d6d: "pixelMapRecord", // "tpmm"
                0x6b545854: "plainText", // "kTXT"
                0x70506c43: "playedCount", // "pPlC"
                0x70506c44: "playedDate", // "pPlD"
                0x70506f73: "playerPosition", // "pPos"
                0x70506c53: "playerState", // "pPlS"
                0x6b505350: "playing", // "kPSP"
                0x63506c79: "playlist", // "cPly"
                0x63506c57: "playlistWindow", // "cPlW"
                0x51447074: "point", // "QDpt"
                0x70706f73: "position", // "ppos"
                0x70455141: "preamp", // "pEQA"
                0x6b507252: "prerelease", // "kPrR"
                0x6c777066: "printerFeatures", // "lwpf"
                0x70736574: "printSettings", // "pset"
                0x70736e20: "processSerialNumber", // "psn "
                0x70414c4c: "properties", // "pALL"
                0x70726f70: "property_", // "prop"
                0x7050726f: "protected", // "pPro"
                0x70756e63: "punctuation", // "punc"
                0x6b507572: "purchased", // "kPur"
                0x6b53704d: "PurchasedMusic", // "kSpM"
                0x70504149: "purchaserAccount", // "pPAI"
                0x70504e6d: "purchaserName", // "pPNm"
                0x6b54756e: "radioTuner", // "kTun"
                0x63525450: "radioTunerPlaylist", // "cRTP"
                0x70527465: "rating", // "pRte"
                0x7052746b: "ratingKind", // "pRtk"
                0x70526177: "rawData", // "pRaw"
                0x646f7562: "real", // "doub"
                0x7265636f: "record", // "reco"
                0x6f626a20: "reference", // "obj "
                0x70526c44: "releaseDate", // "pRlD"
                0x6b52656d: "removed", // "kRem"
                0x6c777174: "requestedPrintTime", // "lwqt"
                0x7072737a: "resizable", // "prsz"
                0x6b505352: "rewinding", // "kPSR"
                0x74723136: "RGB16Color", // "tr16"
                0x74723936: "RGB96Color", // "tr96"
                0x63524742: "RGBColor", // "cRGB"
                0x74726f74: "rotation", // "trot"
                0x70535274: "sampleRate", // "pSRt"
                0x73617420: "Saturday", // "sat "
                0x73637074: "script", // "scpt"
                0x7053654e: "seasonNumber", // "pSeN"
                0x73656c63: "selected", // "selc"
                0x73656c65: "selection", // "sele"
                0x73657020: "September", // "sep "
                0x70536872: "shared", // "pShr"
                0x6b536864: "sharedLibrary", // "kShd"
                0x63536854: "sharedTrack", // "cShT"
                0x73686f72: "shortInteger", // "shor"
                0x70536877: "show", // "pShw"
                0x70536661: "shufflable", // "pSfa"
                0x70536845: "shuffleEnabled", // "pShE"
                0x7053684d: "shuffleMode", // "pShM"
                0x7053697a: "size", // "pSiz"
                0x70536b43: "skippedCount", // "pSkC"
                0x70536b44: "skippedDate", // "pSkD"
                0x73696e67: "smallReal", // "sing"
                0x70536d74: "smart", // "pSmt"
                0x6b4d6453: "song", // "kMdS"
                0x70527074: "songRepeat", // "pRpt"
                0x6b536853: "songs", // "kShS"
                0x7053416c: "sortAlbum", // "pSAl"
                0x70534141: "sortAlbumArtist", // "pSAA"
                0x70534172: "sortArtist", // "pSAr"
                0x7053436d: "sortComposer", // "pSCm"
                0x70534e6d: "sortName", // "pSNm"
                0x7053534e: "sortShow", // "pSSN"
                0x70566f6c: "soundVolume", // "pVol"
                0x63537263: "source", // "cSrc"
                0x7053704b: "specialKind", // "pSpK"
                0x6c777374: "standard", // "lwst"
                0x70537472: "start", // "pStr"
                0x6c776670: "startingPage", // "lwfp"
                0x6b505353: "stopped", // "kPSS"
                0x54455854: "string", // "TEXT"
                0x7374796c: "styledClipboardText", // "styl"
                0x53545854: "styledText", // "STXT"
                0x6b537562: "subscription", // "kSub"
                0x63537550: "subscriptionPlaylist", // "cSuP"
                0x73756e20: "Sunday", // "sun "
                0x70417564: "supportsAudio", // "pAud"
                0x70566964: "supportsVideo", // "pVid"
                0x74727072: "targetPrinter", // "trpr"
                0x74737479: "textStyleInfo", // "tsty"
                0x74687520: "Thursday", // "thu "
                0x54494646: "TIFFPicture", // "TIFF"
                0x7054696d: "time", // "pTim"
                0x6354726b: "track", // "cTrk"
                0x70547243: "trackCount", // "pTrC"
                0x6b54726b: "trackListing", // "kTrk"
                0x7054724e: "trackNumber", // "pTrN"
                0x74756520: "Tuesday", // "tue "
                0x6b415056: "TV", // "kAPV"
                0x6b566454: "TVShow", // "kVdT"
                0x74797065: "typeClass", // "type"
                0x75747874: "UnicodeText", // "utxt"
                0x6b554354: "UnicodeText_", // "kUCT"
                0x6b415055: "unknown", // "kAPU"
                0x6b556e6b: "unknown", // "kUnk"
                0x70556e70: "unplayed", // "pUnp"
                0x75636f6d: "unsignedDoubleInteger", // "ucom"
                0x6d61676e: "unsignedInteger", // "magn"
                0x75736872: "unsignedShortInteger", // "ushr"
                0x70555443: "updateTracks", // "pUTC"
                0x6b55706c: "uploaded", // "kUpl"
                0x63555254: "URLTrack", // "cURT"
                0x6b527455: "user", // "kRtU"
                0x63557350: "userPlaylist", // "cUsP"
                0x75743136: "UTF16Text", // "ut16"
                0x75746638: "UTF8Text", // "utf8"
                0x76657273: "version", // "vers"
                0x634e5057: "videoWindow", // "cNPW"
                0x70506c79: "view", // "pPly"
                0x70766973: "visible", // "pvis"
                0x63566973: "visual", // "cVis"
                0x70567345: "visualsEnabled", // "pVsE"
                0x7041646a: "volumeAdjustment", // "pAdj"
                0x77656420: "Wednesday", // "wed "
                0x77686974: "whitespace", // "whit"
                0x6377696e: "window", // "cwin"
                0x7057726b: "work", // "pWrk"
                0x70736374: "writingCode", // "psct"
                0x6b584d4c: "XML", // "kXML"
                0x70597220: "year", // "pYr "
                0x79657320: "yes", // "yes "
                0x69737a6d: "zoomable", // "iszm"
                0x707a756d: "zoomed", // "pzum"
        ],
        propertyNames: [
                0x70416374: "active", // "pAct"
                0x7055524c: "address", // "pURL"
                0x70415045: "AirPlayEnabled", // "pAPE"
                0x70416c62: "album", // "pAlb"
                0x70416c41: "albumArtist", // "pAlA"
                0x70414874: "albumDisliked", // "pAHt"
                0x70414c76: "albumFavorited", // "pALv"
                0x70416c52: "albumRating", // "pAlR"
                0x7041526b: "albumRatingKind", // "pARk"
                0x70417274: "artist", // "pArt"
                0x70417661: "available", // "pAva"
                0x70455131: "band1", // "pEQ1"
                0x70455130: "band10", // "pEQ0"
                0x70455132: "band2", // "pEQ2"
                0x70455133: "band3", // "pEQ3"
                0x70455134: "band4", // "pEQ4"
                0x70455135: "band5", // "pEQ5"
                0x70455136: "band6", // "pEQ6"
                0x70455137: "band7", // "pEQ7"
                0x70455138: "band8", // "pEQ8"
                0x70455139: "band9", // "pEQ9"
                0x70425274: "bitRate", // "pBRt"
                0x70426b74: "bookmark", // "pBkt"
                0x70426b6d: "bookmarkable", // "pBkm"
                0x70626e64: "bounds", // "pbnd"
                0x7042504d: "bpm", // "pBPM"
                0x63617061: "capacity", // "capa"
                0x70436174: "category", // "pCat"
                0x70636c73: "class_", // "pcls"
                0x68636c62: "closeable", // "hclb"
                0x70436c53: "cloudStatus", // "pClS"
                0x70575368: "collapseable", // "pWSh"
                0x77736864: "collapsed", // "wshd"
                0x6c77636c: "collating", // "lwcl"
                0x70436d74: "comment", // "pCmt"
                0x70416e74: "compilation", // "pAnt"
                0x70436d70: "composer", // "pCmp"
                0x63746e72: "container", // "ctnr"
                0x70436e76: "converting", // "pCnv"
                0x6c776370: "copies", // "lwcp"
                0x70415044: "currentAirPlayDevices", // "pAPD"
                0x70456e63: "currentEncoder", // "pEnc"
                0x70455150: "currentEQPreset", // "pEQP"
                0x70506c61: "currentPlaylist", // "pPla"
                0x70537454: "currentStreamTitle", // "pStT"
                0x70537455: "currentStreamURL", // "pStU"
                0x7054726b: "currentTrack", // "pTrk"
                0x70566973: "currentVisual", // "pVis"
                0x70504354: "data_", // "pPCT"
                0x70444944: "databaseID", // "pDID"
                0x70416464: "dateAdded", // "pAdd"
                0x70446573: "description_", // "pDes"
                0x70447343: "discCount", // "pDsC"
                0x7044734e: "discNumber", // "pDsN"
                0x70486174: "disliked", // "pHat"
                0x70446c41: "downloaded", // "pDlA"
                0x70444149: "downloaderAccount", // "pDAI"
                0x70444e6d: "downloaderName", // "pDNm"
                0x70447572: "duration", // "pDur"
                0x656e626c: "enabled", // "enbl"
                0x6c776c70: "endingPage", // "lwlp"
                0x70457044: "episodeID", // "pEpD"
                0x7045704e: "episodeNumber", // "pEpN"
                0x70455170: "EQ", // "pEQp"
                0x70455120: "EQEnabled", // "pEQ "
                0x6c776568: "errorHandling", // "lweh"
                0x704c6f76: "favorited", // "pLov"
                0x6661786e: "faxNumber", // "faxn"
                0x70537470: "finish", // "pStp"
                0x70466978: "fixedIndexing", // "pFix"
                0x70466d74: "format", // "pFmt"
                0x66727370: "freeSpace", // "frsp"
                0x70697366: "frontmost", // "pisf"
                0x70465363: "fullScreen", // "pFSc"
                0x7047706c: "gapless", // "pGpl"
                0x70476e73: "genius", // "pGns"
                0x7047656e: "genre", // "pGen"
                0x70477270: "grouping", // "pGrp"
                0x49442020: "id", // "ID  "
                0x70696478: "index", // "pidx"
                0x704b6e64: "kind", // "pKnd"
                0x704c6f63: "location", // "pLoc"
                0x704c6473: "longDescription", // "pLds"
                0x704c7972: "lyrics", // "pLyr"
                0x704d644b: "mediaKind", // "pMdK"
                0x704d6f64: "modifiable", // "pMod"
                0x61736d6f: "modificationDate", // "asmo"
                0x704d4e6d: "movement", // "pMNm"
                0x704d7643: "movementCount", // "pMvC"
                0x704d764e: "movementNumber", // "pMvN"
                0x704d7574: "mute", // "pMut"
                0x706e616d: "name", // "pnam"
                0x704d4143: "networkAddress", // "pMAC"
                0x6c776c61: "pagesAcross", // "lwla"
                0x6c776c64: "pagesDown", // "lwld"
                0x70506c50: "parent", // "pPlP"
                0x70504953: "persistentID", // "pPIS"
                0x70506c43: "playedCount", // "pPlC"
                0x70506c44: "playedDate", // "pPlD"
                0x70506f73: "playerPosition", // "pPos"
                0x70506c53: "playerState", // "pPlS"
                0x70706f73: "position", // "ppos"
                0x70455141: "preamp", // "pEQA"
                0x6c777066: "printerFeatures", // "lwpf"
                0x70414c4c: "properties", // "pALL"
                0x7050726f: "protected", // "pPro"
                0x70504149: "purchaserAccount", // "pPAI"
                0x70504e6d: "purchaserName", // "pPNm"
                0x70527465: "rating", // "pRte"
                0x7052746b: "ratingKind", // "pRtk"
                0x70526177: "rawData", // "pRaw"
                0x70526c44: "releaseDate", // "pRlD"
                0x6c777174: "requestedPrintTime", // "lwqt"
                0x7072737a: "resizable", // "prsz"
                0x70535274: "sampleRate", // "pSRt"
                0x7053654e: "seasonNumber", // "pSeN"
                0x73656c63: "selected", // "selc"
                0x73656c65: "selection", // "sele"
                0x70536872: "shared", // "pShr"
                0x70536877: "show", // "pShw"
                0x70536661: "shufflable", // "pSfa"
                0x70536845: "shuffleEnabled", // "pShE"
                0x7053684d: "shuffleMode", // "pShM"
                0x7053697a: "size", // "pSiz"
                0x70536b43: "skippedCount", // "pSkC"
                0x70536b44: "skippedDate", // "pSkD"
                0x70536d74: "smart", // "pSmt"
                0x70527074: "songRepeat", // "pRpt"
                0x7053416c: "sortAlbum", // "pSAl"
                0x70534141: "sortAlbumArtist", // "pSAA"
                0x70534172: "sortArtist", // "pSAr"
                0x7053436d: "sortComposer", // "pSCm"
                0x70534e6d: "sortName", // "pSNm"
                0x7053534e: "sortShow", // "pSSN"
                0x70566f6c: "soundVolume", // "pVol"
                0x7053704b: "specialKind", // "pSpK"
                0x70537472: "start", // "pStr"
                0x6c776670: "startingPage", // "lwfp"
                0x70417564: "supportsAudio", // "pAud"
                0x70566964: "supportsVideo", // "pVid"
                0x74727072: "targetPrinter", // "trpr"
                0x7054696d: "time", // "pTim"
                0x70547243: "trackCount", // "pTrC"
                0x7054724e: "trackNumber", // "pTrN"
                0x70556e70: "unplayed", // "pUnp"
                0x70555443: "updateTracks", // "pUTC"
                0x76657273: "version", // "vers"
                0x70506c79: "view", // "pPly"
                0x70766973: "visible", // "pvis"
                0x70567345: "visualsEnabled", // "pVsE"
                0x7041646a: "volumeAdjustment", // "pAdj"
                0x7057726b: "work", // "pWrk"
                0x70597220: "year", // "pYr "
                0x69737a6d: "zoomable", // "iszm"
                0x707a756d: "zoomed", // "pzum"
        ],
        elementsNames: [
                0x63415044: ("AirPlayDevice", "AirPlayDevices"), // "cAPD"
                0x63617070: ("application", "applications"), // "capp"
                0x63417274: ("artwork", "artworks"), // "cArt"
                0x63434450: ("audioCDPlaylist", "audioCDPlaylists"), // "cCDP"
                0x63434454: ("audioCDTrack", "audioCDTracks"), // "cCDT"
                0x63427257: ("browserWindow", "browserWindows"), // "cBrW"
                0x63456e63: ("encoder", "encoders"), // "cEnc"
                0x63455150: ("EQPreset", "EQPresets"), // "cEQP"
                0x63455157: ("EQWindow", "EQWindows"), // "cEQW"
                0x63466c54: ("fileTrack", "fileTracks"), // "cFlT"
                0x63466f50: ("folderPlaylist", "folderPlaylists"), // "cFoP"
                0x636f626a: ("item", "items"), // "cobj"
                0x634c6950: ("libraryPlaylist", "libraryPlaylists"), // "cLiP"
                0x634d5057: ("miniplayerWindow", "miniplayerWindows"), // "cMPW"
                0x63506c79: ("playlist", "playlists"), // "cPly"
                0x63506c57: ("playlistWindow", "playlistWindows"), // "cPlW"
                0x63525450: ("radioTunerPlaylist", "radioTunerPlaylists"), // "cRTP"
                0x63536854: ("sharedTrack", "sharedTracks"), // "cShT"
                0x63537263: ("source", "sources"), // "cSrc"
                0x63537550: ("subscriptionPlaylist", "subscriptionPlaylists"), // "cSuP"
                0x6354726b: ("track", "tracks"), // "cTrk"
                0x63555254: ("URLTrack", "URLTracks"), // "cURT"
                0x63557350: ("userPlaylist", "userPlaylists"), // "cUsP"
                0x634e5057: ("videoWindow", "videoWindows"), // "cNPW"
                0x63566973: ("visual", "visuals"), // "cVis"
                0x6377696e: ("window", "windows"), // "cwin"
        ])

private let _glueClasses = SwiftAutomation.GlueClasses(
                                                insertionSpecifierType: MUSInsertion.self,
                                                objectSpecifierType: MUSItem.self,
                                                multiObjectSpecifierType: MUSItems.self,
                                                rootSpecifierType: MUSRoot.self,
                                                applicationType: Music.self,
                                                symbolType: MUSSymbol.self,
                                                formatter: _specifierFormatter)

private let _untargetedAppData = SwiftAutomation.AppData(glueClasses: _glueClasses)


/******************************************************************************/
// Symbol subclass defines static type/enum/property constants based on Music.app terminology

public class MUSSymbol: SwiftAutomation.Symbol {

    override public var typeAliasName: String {return "MUS"}

    public override class func symbol(code: OSType, type: OSType = typeType, descriptor: ScalarDescriptor? = nil) -> MUSSymbol {
        switch (code) {
        case 0x70416374: return self.active // "pAct"
        case 0x7055524c: return self.address // "pURL"
        case 0x63415044: return self.AirPlayDevice // "cAPD"
        case 0x6b41504f: return self.AirPlayDevice // "kAPO"
        case 0x70415045: return self.AirPlayEnabled // "pAPE"
        case 0x6b415058: return self.AirPortExpress // "kAPX"
        case 0x70416c62: return self.album // "pAlb"
        case 0x70416c41: return self.albumArtist // "pAlA"
        case 0x70414874: return self.albumDisliked // "pAHt"
        case 0x70414c76: return self.albumFavorited // "pALv"
        case 0x6b416c62: return self.albumListing // "kAlb"
        case 0x70416c52: return self.albumRating // "pAlR"
        case 0x7041526b: return self.albumRatingKind // "pARk"
        case 0x6b536841: return self.albums // "kShA"
        case 0x6b53724c: return self.albums // "kSrL"
        case 0x616c6973: return self.alias // "alis"
        case 0x6b416c6c: return self.all_ // "kAll"
        case 0x2a2a2a2a: return self.anything // "****"
        case 0x6b415054: return self.AppleTV // "kAPT"
        case 0x63617070: return self.application // "capp"
        case 0x62756e64: return self.applicationBundleID // "bund"
        case 0x7369676e: return self.applicationSignature // "sign"
        case 0x6170726c: return self.applicationURL // "aprl"
        case 0x61707220: return self.April // "apr "
        case 0x70417274: return self.artist // "pArt"
        case 0x6b537252: return self.artists // "kSrR"
        case 0x63417274: return self.artwork // "cArt"
        case 0x61736b20: return self.ask // "ask "
        case 0x6b414344: return self.audioCD // "kACD"
        case 0x63434450: return self.audioCDPlaylist // "cCDP"
        case 0x63434454: return self.audioCDTrack // "cCDT"
        case 0x61756720: return self.August // "aug "
        case 0x70417661: return self.available // "pAva"
        case 0x70455131: return self.band1 // "pEQ1"
        case 0x70455130: return self.band10 // "pEQ0"
        case 0x70455132: return self.band2 // "pEQ2"
        case 0x70455133: return self.band3 // "pEQ3"
        case 0x70455134: return self.band4 // "pEQ4"
        case 0x70455135: return self.band5 // "pEQ5"
        case 0x70455136: return self.band6 // "pEQ6"
        case 0x70455137: return self.band7 // "pEQ7"
        case 0x70455138: return self.band8 // "pEQ8"
        case 0x70455139: return self.band9 // "pEQ9"
        case 0x62657374: return self.best // "best"
        case 0x70425274: return self.bitRate // "pBRt"
        case 0x6b415042: return self.BluetoothDevice // "kAPB"
        case 0x70426b74: return self.bookmark // "pBkt"
        case 0x70426b6d: return self.bookmarkable // "pBkm"
        case 0x626d726b: return self.bookmarkData // "bmrk"
        case 0x626f6f6c: return self.boolean // "bool"
        case 0x71647274: return self.boundingRectangle // "qdrt"
        case 0x70626e64: return self.bounds // "pbnd"
        case 0x7042504d: return self.bpm // "pBPM"
        case 0x63427257: return self.browserWindow // "cBrW"
        case 0x63617061: return self.capacity // "capa"
        case 0x63617365: return self.case_ // "case"
        case 0x70436174: return self.category // "pCat"
        case 0x6b434469: return self.cdInsert // "kCDi"
        case 0x70636c73: return self.class_ // "pcls"
        case 0x68636c62: return self.closeable // "hclb"
        case 0x70436c53: return self.cloudStatus // "pClS"
        case 0x70575368: return self.collapseable // "pWSh"
        case 0x77736864: return self.collapsed // "wshd"
        case 0x6c77636c: return self.collating // "lwcl"
        case 0x636c7274: return self.colorTable // "clrt"
        case 0x70436d74: return self.comment // "pCmt"
        case 0x70416e74: return self.compilation // "pAnt"
        case 0x70436d70: return self.composer // "pCmp"
        case 0x6b537243: return self.composers // "kSrC"
        case 0x6b527443: return self.computed // "kRtC"
        case 0x6b415043: return self.computer // "kAPC"
        case 0x656e756d: return self.constant // "enum"
        case 0x63746e72: return self.container // "ctnr"
        case 0x70436e76: return self.converting // "pCnv"
        case 0x6c776370: return self.copies // "lwcp"
        case 0x70415044: return self.currentAirPlayDevices // "pAPD"
        case 0x70456e63: return self.currentEncoder // "pEnc"
        case 0x70455150: return self.currentEQPreset // "pEQP"
        case 0x70506c61: return self.currentPlaylist // "pPla"
        case 0x70537454: return self.currentStreamTitle // "pStT"
        case 0x70537455: return self.currentStreamURL // "pStU"
        case 0x7054726b: return self.currentTrack // "pTrk"
        case 0x70566973: return self.currentVisual // "pVis"
        case 0x74646173: return self.dashStyle // "tdas"
        case 0x74647461: return self.data // "tdta"
        case 0x70504354: return self.data_ // "pPCT"
        case 0x70444944: return self.databaseID // "pDID"
        case 0x6c647420: return self.date // "ldt "
        case 0x70416464: return self.dateAdded // "pAdd"
        case 0x64656320: return self.December // "dec "
        case 0x6465636d: return self.decimalStruct // "decm"
        case 0x70446573: return self.description_ // "pDes"
        case 0x6c776474: return self.detailed // "lwdt"
        case 0x64696163: return self.diacriticals // "diac"
        case 0x70447343: return self.discCount // "pDsC"
        case 0x7044734e: return self.discNumber // "pDsN"
        case 0x70486174: return self.disliked // "pHat"
        case 0x6b537256: return self.displayed // "kSrV"
        case 0x636f6d70: return self.doubleInteger // "comp"
        case 0x70446c41: return self.downloaded // "pDlA"
        case 0x70444149: return self.downloaderAccount // "pDAI"
        case 0x70444e6d: return self.downloaderName // "pDNm"
        case 0x6b447570: return self.duplicate // "kDup"
        case 0x70447572: return self.duration // "pDur"
        case 0x656e626c: return self.enabled // "enbl"
        case 0x656e6373: return self.encodedString // "encs"
        case 0x63456e63: return self.encoder // "cEnc"
        case 0x6c776c70: return self.endingPage // "lwlp"
        case 0x70457044: return self.episodeID // "pEpD"
        case 0x7045704e: return self.episodeNumber // "pEpN"
        case 0x45505320: return self.EPSPicture // "EPS "
        case 0x70455170: return self.EQ // "pEQp"
        case 0x70455120: return self.EQEnabled // "pEQ "
        case 0x63455150: return self.EQPreset // "cEQP"
        case 0x63455157: return self.EQWindow // "cEQW"
        case 0x6b457272: return self.error // "kErr"
        case 0x6c776568: return self.errorHandling // "lweh"
        case 0x65787061: return self.expansion // "expa"
        case 0x6b505346: return self.fastForwarding // "kPSF"
        case 0x704c6f76: return self.favorited // "pLov"
        case 0x6661786e: return self.faxNumber // "faxn"
        case 0x66656220: return self.February // "feb "
        case 0x66737266: return self.fileRef // "fsrf"
        case 0x63466c54: return self.fileTrack // "cFlT"
        case 0x6675726c: return self.fileURL // "furl"
        case 0x70537470: return self.finish // "pStp"
        case 0x66697864: return self.fixed // "fixd"
        case 0x70466978: return self.fixedIndexing // "pFix"
        case 0x66706e74: return self.fixedPoint // "fpnt"
        case 0x66726374: return self.fixedRectangle // "frct"
        case 0x6b537046: return self.folder // "kSpF"
        case 0x63466f50: return self.folderPlaylist // "cFoP"
        case 0x70466d74: return self.format // "pFmt"
        case 0x66727370: return self.freeSpace // "frsp"
        case 0x66726920: return self.Friday // "fri "
        case 0x70697366: return self.frontmost // "pisf"
        case 0x70465363: return self.fullScreen // "pFSc"
        case 0x7047706c: return self.gapless // "pGpl"
        case 0x70476e73: return self.genius // "pGns"
        case 0x6b537047: return self.Genius // "kSpG"
        case 0x7047656e: return self.genre // "pGen"
        case 0x47494666: return self.GIFPicture // "GIFf"
        case 0x63677478: return self.graphicText // "cgtx"
        case 0x70477270: return self.grouping // "pGrp"
        case 0x6b536847: return self.groupings // "kShG"
        case 0x6b415048: return self.HomePod // "kAPH"
        case 0x68797068: return self.hyphens // "hyph"
        case 0x49442020: return self.id // "ID  "
        case 0x70696478: return self.index // "pidx"
        case 0x6b52656a: return self.ineligible // "kRej"
        case 0x6c6f6e67: return self.integer // "long"
        case 0x69747874: return self.internationalText // "itxt"
        case 0x696e746c: return self.internationalWritingCode // "intl"
        case 0x636f626a: return self.item // "cobj"
        case 0x6b495453: return self.iTunesStore // "kITS"
        case 0x6a616e20: return self.January // "jan "
        case 0x4a504547: return self.JPEGPicture // "JPEG"
        case 0x6a756c20: return self.July // "jul "
        case 0x6a756e20: return self.June // "jun "
        case 0x6b706964: return self.kernelProcessID // "kpid"
        case 0x704b6e64: return self.kind // "pKnd"
        case 0x6c64626c: return self.largeReal // "ldbl"
        case 0x6b53704c: return self.Library // "kSpL"
        case 0x6b4c6962: return self.library // "kLib"
        case 0x634c6950: return self.libraryPlaylist // "cLiP"
        case 0x6c697374: return self.list // "list"
        case 0x704c6f63: return self.location // "pLoc"
        case 0x696e736c: return self.locationReference // "insl"
        case 0x704c6473: return self.longDescription // "pLds"
        case 0x6c667864: return self.longFixed // "lfxd"
        case 0x6c667074: return self.longFixedPoint // "lfpt"
        case 0x6c667263: return self.longFixedRectangle // "lfrc"
        case 0x6c706e74: return self.longPoint // "lpnt"
        case 0x6c726374: return self.longRectangle // "lrct"
        case 0x704c7972: return self.lyrics // "pLyr"
        case 0x6b4d3355: return self.M3U // "kM3U"
        case 0x6b4d3338: return self.M3U8 // "kM38"
        case 0x6d616368: return self.machine // "mach"
        case 0x6d4c6f63: return self.machineLocation // "mLoc"
        case 0x706f7274: return self.machPort // "port"
        case 0x6d617220: return self.March // "mar "
        case 0x6b4d6174: return self.matched // "kMat"
        case 0x6d617920: return self.May // "may "
        case 0x704d644b: return self.mediaKind // "pMdK"
        case 0x634d5057: return self.miniplayerWindow // "cMPW"
        case 0x704d6f64: return self.modifiable // "pMod"
        case 0x61736d6f: return self.modificationDate // "asmo"
        case 0x6d6f6e20: return self.Monday // "mon "
        case 0x704d4e6d: return self.movement // "pMNm"
        case 0x704d7643: return self.movementCount // "pMvC"
        case 0x704d764e: return self.movementNumber // "pMvN"
        case 0x6b56644d: return self.movie // "kVdM"
        case 0x6b4d4344: return self.MP3CD // "kMCD"
        case 0x6b53705a: return self.Music // "kSpZ"
        case 0x6b566456: return self.musicVideo // "kVdV"
        case 0x704d7574: return self.mute // "pMut"
        case 0x706e616d: return self.name // "pnam"
        case 0x6b537253: return self.names // "kSrS"
        case 0x704d4143: return self.networkAddress // "pMAC"
        case 0x6e6f2020: return self.no // "no  "
        case 0x6b526576: return self.noLongerAvailable // "kRev"
        case 0x6b4e6f6e: return self.none // "kNon"
        case 0x6b557050: return self.notUploaded // "kUpP"
        case 0x6e6f7620: return self.November // "nov "
        case 0x6e756c6c: return self.null // "null"
        case 0x6e756d65: return self.numericStrings // "nume"
        case 0x6f637420: return self.October // "oct "
        case 0x6b52704f: return self.off // "kRpO"
        case 0x6b527031: return self.one // "kRp1"
        case 0x6c776c61: return self.pagesAcross // "lwla"
        case 0x6c776c64: return self.pagesDown // "lwld"
        case 0x70506c50: return self.parent // "pPlP"
        case 0x6b505370: return self.paused // "kPSp"
        case 0x70504953: return self.persistentID // "pPIS"
        case 0x50494354: return self.picture // "PICT"
        case 0x74706d6d: return self.pixelMapRecord // "tpmm"
        case 0x6b545854: return self.plainText // "kTXT"
        case 0x70506c43: return self.playedCount // "pPlC"
        case 0x70506c44: return self.playedDate // "pPlD"
        case 0x70506f73: return self.playerPosition // "pPos"
        case 0x70506c53: return self.playerState // "pPlS"
        case 0x6b505350: return self.playing // "kPSP"
        case 0x63506c79: return self.playlist // "cPly"
        case 0x63506c57: return self.playlistWindow // "cPlW"
        case 0x51447074: return self.point // "QDpt"
        case 0x70706f73: return self.position // "ppos"
        case 0x70455141: return self.preamp // "pEQA"
        case 0x6b507252: return self.prerelease // "kPrR"
        case 0x6c777066: return self.printerFeatures // "lwpf"
        case 0x70736574: return self.printSettings // "pset"
        case 0x70736e20: return self.processSerialNumber // "psn "
        case 0x70414c4c: return self.properties // "pALL"
        case 0x70726f70: return self.property_ // "prop"
        case 0x7050726f: return self.protected // "pPro"
        case 0x70756e63: return self.punctuation // "punc"
        case 0x6b507572: return self.purchased // "kPur"
        case 0x6b53704d: return self.PurchasedMusic // "kSpM"
        case 0x70504149: return self.purchaserAccount // "pPAI"
        case 0x70504e6d: return self.purchaserName // "pPNm"
        case 0x6b54756e: return self.radioTuner // "kTun"
        case 0x63525450: return self.radioTunerPlaylist // "cRTP"
        case 0x70527465: return self.rating // "pRte"
        case 0x7052746b: return self.ratingKind // "pRtk"
        case 0x70526177: return self.rawData // "pRaw"
        case 0x646f7562: return self.real // "doub"
        case 0x7265636f: return self.record // "reco"
        case 0x6f626a20: return self.reference // "obj "
        case 0x70526c44: return self.releaseDate // "pRlD"
        case 0x6b52656d: return self.removed // "kRem"
        case 0x6c777174: return self.requestedPrintTime // "lwqt"
        case 0x7072737a: return self.resizable // "prsz"
        case 0x6b505352: return self.rewinding // "kPSR"
        case 0x74723136: return self.RGB16Color // "tr16"
        case 0x74723936: return self.RGB96Color // "tr96"
        case 0x63524742: return self.RGBColor // "cRGB"
        case 0x74726f74: return self.rotation // "trot"
        case 0x70535274: return self.sampleRate // "pSRt"
        case 0x73617420: return self.Saturday // "sat "
        case 0x73637074: return self.script // "scpt"
        case 0x7053654e: return self.seasonNumber // "pSeN"
        case 0x73656c63: return self.selected // "selc"
        case 0x73656c65: return self.selection // "sele"
        case 0x73657020: return self.September // "sep "
        case 0x70536872: return self.shared // "pShr"
        case 0x6b536864: return self.sharedLibrary // "kShd"
        case 0x63536854: return self.sharedTrack // "cShT"
        case 0x73686f72: return self.shortInteger // "shor"
        case 0x70536877: return self.show // "pShw"
        case 0x70536661: return self.shufflable // "pSfa"
        case 0x70536845: return self.shuffleEnabled // "pShE"
        case 0x7053684d: return self.shuffleMode // "pShM"
        case 0x7053697a: return self.size // "pSiz"
        case 0x70536b43: return self.skippedCount // "pSkC"
        case 0x70536b44: return self.skippedDate // "pSkD"
        case 0x73696e67: return self.smallReal // "sing"
        case 0x70536d74: return self.smart // "pSmt"
        case 0x6b4d6453: return self.song // "kMdS"
        case 0x70527074: return self.songRepeat // "pRpt"
        case 0x6b536853: return self.songs // "kShS"
        case 0x7053416c: return self.sortAlbum // "pSAl"
        case 0x70534141: return self.sortAlbumArtist // "pSAA"
        case 0x70534172: return self.sortArtist // "pSAr"
        case 0x7053436d: return self.sortComposer // "pSCm"
        case 0x70534e6d: return self.sortName // "pSNm"
        case 0x7053534e: return self.sortShow // "pSSN"
        case 0x70566f6c: return self.soundVolume // "pVol"
        case 0x63537263: return self.source // "cSrc"
        case 0x7053704b: return self.specialKind // "pSpK"
        case 0x6c777374: return self.standard // "lwst"
        case 0x70537472: return self.start // "pStr"
        case 0x6c776670: return self.startingPage // "lwfp"
        case 0x6b505353: return self.stopped // "kPSS"
        case 0x54455854: return self.string // "TEXT"
        case 0x7374796c: return self.styledClipboardText // "styl"
        case 0x53545854: return self.styledText // "STXT"
        case 0x6b537562: return self.subscription // "kSub"
        case 0x63537550: return self.subscriptionPlaylist // "cSuP"
        case 0x73756e20: return self.Sunday // "sun "
        case 0x70417564: return self.supportsAudio // "pAud"
        case 0x70566964: return self.supportsVideo // "pVid"
        case 0x74727072: return self.targetPrinter // "trpr"
        case 0x74737479: return self.textStyleInfo // "tsty"
        case 0x74687520: return self.Thursday // "thu "
        case 0x54494646: return self.TIFFPicture // "TIFF"
        case 0x7054696d: return self.time // "pTim"
        case 0x6354726b: return self.track // "cTrk"
        case 0x70547243: return self.trackCount // "pTrC"
        case 0x6b54726b: return self.trackListing // "kTrk"
        case 0x7054724e: return self.trackNumber // "pTrN"
        case 0x74756520: return self.Tuesday // "tue "
        case 0x6b415056: return self.TV // "kAPV"
        case 0x6b566454: return self.TVShow // "kVdT"
        case 0x74797065: return self.typeClass // "type"
        case 0x75747874: return self.UnicodeText // "utxt"
        case 0x6b554354: return self.UnicodeText_ // "kUCT"
        case 0x6b415055: return self.unknown // "kAPU"
        case 0x6b556e6b: return self.unknown // "kUnk"
        case 0x70556e70: return self.unplayed // "pUnp"
        case 0x75636f6d: return self.unsignedDoubleInteger // "ucom"
        case 0x6d61676e: return self.unsignedInteger // "magn"
        case 0x75736872: return self.unsignedShortInteger // "ushr"
        case 0x70555443: return self.updateTracks // "pUTC"
        case 0x6b55706c: return self.uploaded // "kUpl"
        case 0x63555254: return self.URLTrack // "cURT"
        case 0x6b527455: return self.user // "kRtU"
        case 0x63557350: return self.userPlaylist // "cUsP"
        case 0x75743136: return self.UTF16Text // "ut16"
        case 0x75746638: return self.UTF8Text // "utf8"
        case 0x76657273: return self.version // "vers"
        case 0x634e5057: return self.videoWindow // "cNPW"
        case 0x70506c79: return self.view // "pPly"
        case 0x70766973: return self.visible // "pvis"
        case 0x63566973: return self.visual // "cVis"
        case 0x70567345: return self.visualsEnabled // "pVsE"
        case 0x7041646a: return self.volumeAdjustment // "pAdj"
        case 0x77656420: return self.Wednesday // "wed "
        case 0x77686974: return self.whitespace // "whit"
        case 0x6377696e: return self.window // "cwin"
        case 0x7057726b: return self.work // "pWrk"
        case 0x70736374: return self.writingCode // "psct"
        case 0x6b584d4c: return self.XML // "kXML"
        case 0x70597220: return self.year // "pYr "
        case 0x79657320: return self.yes // "yes "
        case 0x69737a6d: return self.zoomable // "iszm"
        case 0x707a756d: return self.zoomed // "pzum"
        default: return super.symbol(code: code, type: type, descriptor: descriptor) as! MUSSymbol
        }
    }

    // Types/properties
    public static let active = MUSSymbol(name: "active", code: 0x70416374, type: typeType) // "pAct"
    public static let address = MUSSymbol(name: "address", code: 0x7055524c, type: typeType) // "pURL"
    public static let AirPlayDevice = MUSSymbol(name: "AirPlayDevice", code: 0x63415044, type: typeType) // "cAPD"
    public static let AirPlayEnabled = MUSSymbol(name: "AirPlayEnabled", code: 0x70415045, type: typeType) // "pAPE"
    public static let album = MUSSymbol(name: "album", code: 0x70416c62, type: typeType) // "pAlb"
    public static let albumArtist = MUSSymbol(name: "albumArtist", code: 0x70416c41, type: typeType) // "pAlA"
    public static let albumDisliked = MUSSymbol(name: "albumDisliked", code: 0x70414874, type: typeType) // "pAHt"
    public static let albumFavorited = MUSSymbol(name: "albumFavorited", code: 0x70414c76, type: typeType) // "pALv"
    public static let albumRating = MUSSymbol(name: "albumRating", code: 0x70416c52, type: typeType) // "pAlR"
    public static let albumRatingKind = MUSSymbol(name: "albumRatingKind", code: 0x7041526b, type: typeType) // "pARk"
    public static let alias = MUSSymbol(name: "alias", code: 0x616c6973, type: typeType) // "alis"
    public static let anything = MUSSymbol(name: "anything", code: 0x2a2a2a2a, type: typeType) // "****"
    public static let application = MUSSymbol(name: "application", code: 0x63617070, type: typeType) // "capp"
    public static let applicationBundleID = MUSSymbol(name: "applicationBundleID", code: 0x62756e64, type: typeType) // "bund"
    public static let applicationSignature = MUSSymbol(name: "applicationSignature", code: 0x7369676e, type: typeType) // "sign"
    public static let applicationURL = MUSSymbol(name: "applicationURL", code: 0x6170726c, type: typeType) // "aprl"
    public static let April = MUSSymbol(name: "April", code: 0x61707220, type: typeType) // "apr "
    public static let artist = MUSSymbol(name: "artist", code: 0x70417274, type: typeType) // "pArt"
    public static let artwork = MUSSymbol(name: "artwork", code: 0x63417274, type: typeType) // "cArt"
    public static let audioCDPlaylist = MUSSymbol(name: "audioCDPlaylist", code: 0x63434450, type: typeType) // "cCDP"
    public static let audioCDTrack = MUSSymbol(name: "audioCDTrack", code: 0x63434454, type: typeType) // "cCDT"
    public static let August = MUSSymbol(name: "August", code: 0x61756720, type: typeType) // "aug "
    public static let available = MUSSymbol(name: "available", code: 0x70417661, type: typeType) // "pAva"
    public static let band1 = MUSSymbol(name: "band1", code: 0x70455131, type: typeType) // "pEQ1"
    public static let band10 = MUSSymbol(name: "band10", code: 0x70455130, type: typeType) // "pEQ0"
    public static let band2 = MUSSymbol(name: "band2", code: 0x70455132, type: typeType) // "pEQ2"
    public static let band3 = MUSSymbol(name: "band3", code: 0x70455133, type: typeType) // "pEQ3"
    public static let band4 = MUSSymbol(name: "band4", code: 0x70455134, type: typeType) // "pEQ4"
    public static let band5 = MUSSymbol(name: "band5", code: 0x70455135, type: typeType) // "pEQ5"
    public static let band6 = MUSSymbol(name: "band6", code: 0x70455136, type: typeType) // "pEQ6"
    public static let band7 = MUSSymbol(name: "band7", code: 0x70455137, type: typeType) // "pEQ7"
    public static let band8 = MUSSymbol(name: "band8", code: 0x70455138, type: typeType) // "pEQ8"
    public static let band9 = MUSSymbol(name: "band9", code: 0x70455139, type: typeType) // "pEQ9"
    public static let best = MUSSymbol(name: "best", code: 0x62657374, type: typeType) // "best"
    public static let bitRate = MUSSymbol(name: "bitRate", code: 0x70425274, type: typeType) // "pBRt"
    public static let bookmark = MUSSymbol(name: "bookmark", code: 0x70426b74, type: typeType) // "pBkt"
    public static let bookmarkable = MUSSymbol(name: "bookmarkable", code: 0x70426b6d, type: typeType) // "pBkm"
    public static let bookmarkData = MUSSymbol(name: "bookmarkData", code: 0x626d726b, type: typeType) // "bmrk"
    public static let boolean = MUSSymbol(name: "boolean", code: 0x626f6f6c, type: typeType) // "bool"
    public static let boundingRectangle = MUSSymbol(name: "boundingRectangle", code: 0x71647274, type: typeType) // "qdrt"
    public static let bounds = MUSSymbol(name: "bounds", code: 0x70626e64, type: typeType) // "pbnd"
    public static let bpm = MUSSymbol(name: "bpm", code: 0x7042504d, type: typeType) // "pBPM"
    public static let browserWindow = MUSSymbol(name: "browserWindow", code: 0x63427257, type: typeType) // "cBrW"
    public static let capacity = MUSSymbol(name: "capacity", code: 0x63617061, type: typeType) // "capa"
    public static let category = MUSSymbol(name: "category", code: 0x70436174, type: typeType) // "pCat"
    public static let class_ = MUSSymbol(name: "class_", code: 0x70636c73, type: typeType) // "pcls"
    public static let closeable = MUSSymbol(name: "closeable", code: 0x68636c62, type: typeType) // "hclb"
    public static let cloudStatus = MUSSymbol(name: "cloudStatus", code: 0x70436c53, type: typeType) // "pClS"
    public static let collapseable = MUSSymbol(name: "collapseable", code: 0x70575368, type: typeType) // "pWSh"
    public static let collapsed = MUSSymbol(name: "collapsed", code: 0x77736864, type: typeType) // "wshd"
    public static let collating = MUSSymbol(name: "collating", code: 0x6c77636c, type: typeType) // "lwcl"
    public static let colorTable = MUSSymbol(name: "colorTable", code: 0x636c7274, type: typeType) // "clrt"
    public static let comment = MUSSymbol(name: "comment", code: 0x70436d74, type: typeType) // "pCmt"
    public static let compilation = MUSSymbol(name: "compilation", code: 0x70416e74, type: typeType) // "pAnt"
    public static let composer = MUSSymbol(name: "composer", code: 0x70436d70, type: typeType) // "pCmp"
    public static let constant = MUSSymbol(name: "constant", code: 0x656e756d, type: typeType) // "enum"
    public static let container = MUSSymbol(name: "container", code: 0x63746e72, type: typeType) // "ctnr"
    public static let converting = MUSSymbol(name: "converting", code: 0x70436e76, type: typeType) // "pCnv"
    public static let copies = MUSSymbol(name: "copies", code: 0x6c776370, type: typeType) // "lwcp"
    public static let currentAirPlayDevices = MUSSymbol(name: "currentAirPlayDevices", code: 0x70415044, type: typeType) // "pAPD"
    public static let currentEncoder = MUSSymbol(name: "currentEncoder", code: 0x70456e63, type: typeType) // "pEnc"
    public static let currentEQPreset = MUSSymbol(name: "currentEQPreset", code: 0x70455150, type: typeType) // "pEQP"
    public static let currentPlaylist = MUSSymbol(name: "currentPlaylist", code: 0x70506c61, type: typeType) // "pPla"
    public static let currentStreamTitle = MUSSymbol(name: "currentStreamTitle", code: 0x70537454, type: typeType) // "pStT"
    public static let currentStreamURL = MUSSymbol(name: "currentStreamURL", code: 0x70537455, type: typeType) // "pStU"
    public static let currentTrack = MUSSymbol(name: "currentTrack", code: 0x7054726b, type: typeType) // "pTrk"
    public static let currentVisual = MUSSymbol(name: "currentVisual", code: 0x70566973, type: typeType) // "pVis"
    public static let dashStyle = MUSSymbol(name: "dashStyle", code: 0x74646173, type: typeType) // "tdas"
    public static let data = MUSSymbol(name: "data", code: 0x74647461, type: typeType) // "tdta"
    public static let data_ = MUSSymbol(name: "data_", code: 0x70504354, type: typeType) // "pPCT"
    public static let databaseID = MUSSymbol(name: "databaseID", code: 0x70444944, type: typeType) // "pDID"
    public static let date = MUSSymbol(name: "date", code: 0x6c647420, type: typeType) // "ldt "
    public static let dateAdded = MUSSymbol(name: "dateAdded", code: 0x70416464, type: typeType) // "pAdd"
    public static let December = MUSSymbol(name: "December", code: 0x64656320, type: typeType) // "dec "
    public static let decimalStruct = MUSSymbol(name: "decimalStruct", code: 0x6465636d, type: typeType) // "decm"
    public static let description_ = MUSSymbol(name: "description_", code: 0x70446573, type: typeType) // "pDes"
    public static let discCount = MUSSymbol(name: "discCount", code: 0x70447343, type: typeType) // "pDsC"
    public static let discNumber = MUSSymbol(name: "discNumber", code: 0x7044734e, type: typeType) // "pDsN"
    public static let disliked = MUSSymbol(name: "disliked", code: 0x70486174, type: typeType) // "pHat"
    public static let doubleInteger = MUSSymbol(name: "doubleInteger", code: 0x636f6d70, type: typeType) // "comp"
    public static let downloaded = MUSSymbol(name: "downloaded", code: 0x70446c41, type: typeType) // "pDlA"
    public static let downloaderAccount = MUSSymbol(name: "downloaderAccount", code: 0x70444149, type: typeType) // "pDAI"
    public static let downloaderName = MUSSymbol(name: "downloaderName", code: 0x70444e6d, type: typeType) // "pDNm"
    public static let duration = MUSSymbol(name: "duration", code: 0x70447572, type: typeType) // "pDur"
    public static let enabled = MUSSymbol(name: "enabled", code: 0x656e626c, type: typeType) // "enbl"
    public static let encodedString = MUSSymbol(name: "encodedString", code: 0x656e6373, type: typeType) // "encs"
    public static let encoder = MUSSymbol(name: "encoder", code: 0x63456e63, type: typeType) // "cEnc"
    public static let endingPage = MUSSymbol(name: "endingPage", code: 0x6c776c70, type: typeType) // "lwlp"
    public static let episodeID = MUSSymbol(name: "episodeID", code: 0x70457044, type: typeType) // "pEpD"
    public static let episodeNumber = MUSSymbol(name: "episodeNumber", code: 0x7045704e, type: typeType) // "pEpN"
    public static let EPSPicture = MUSSymbol(name: "EPSPicture", code: 0x45505320, type: typeType) // "EPS "
    public static let EQ = MUSSymbol(name: "EQ", code: 0x70455170, type: typeType) // "pEQp"
    public static let EQEnabled = MUSSymbol(name: "EQEnabled", code: 0x70455120, type: typeType) // "pEQ "
    public static let EQPreset = MUSSymbol(name: "EQPreset", code: 0x63455150, type: typeType) // "cEQP"
    public static let EQWindow = MUSSymbol(name: "EQWindow", code: 0x63455157, type: typeType) // "cEQW"
    public static let errorHandling = MUSSymbol(name: "errorHandling", code: 0x6c776568, type: typeType) // "lweh"
    public static let favorited = MUSSymbol(name: "favorited", code: 0x704c6f76, type: typeType) // "pLov"
    public static let faxNumber = MUSSymbol(name: "faxNumber", code: 0x6661786e, type: typeType) // "faxn"
    public static let February = MUSSymbol(name: "February", code: 0x66656220, type: typeType) // "feb "
    public static let fileRef = MUSSymbol(name: "fileRef", code: 0x66737266, type: typeType) // "fsrf"
    public static let fileTrack = MUSSymbol(name: "fileTrack", code: 0x63466c54, type: typeType) // "cFlT"
    public static let fileURL = MUSSymbol(name: "fileURL", code: 0x6675726c, type: typeType) // "furl"
    public static let finish = MUSSymbol(name: "finish", code: 0x70537470, type: typeType) // "pStp"
    public static let fixed = MUSSymbol(name: "fixed", code: 0x66697864, type: typeType) // "fixd"
    public static let fixedIndexing = MUSSymbol(name: "fixedIndexing", code: 0x70466978, type: typeType) // "pFix"
    public static let fixedPoint = MUSSymbol(name: "fixedPoint", code: 0x66706e74, type: typeType) // "fpnt"
    public static let fixedRectangle = MUSSymbol(name: "fixedRectangle", code: 0x66726374, type: typeType) // "frct"
    public static let folderPlaylist = MUSSymbol(name: "folderPlaylist", code: 0x63466f50, type: typeType) // "cFoP"
    public static let format = MUSSymbol(name: "format", code: 0x70466d74, type: typeType) // "pFmt"
    public static let freeSpace = MUSSymbol(name: "freeSpace", code: 0x66727370, type: typeType) // "frsp"
    public static let Friday = MUSSymbol(name: "Friday", code: 0x66726920, type: typeType) // "fri "
    public static let frontmost = MUSSymbol(name: "frontmost", code: 0x70697366, type: typeType) // "pisf"
    public static let fullScreen = MUSSymbol(name: "fullScreen", code: 0x70465363, type: typeType) // "pFSc"
    public static let gapless = MUSSymbol(name: "gapless", code: 0x7047706c, type: typeType) // "pGpl"
    public static let genius = MUSSymbol(name: "genius", code: 0x70476e73, type: typeType) // "pGns"
    public static let genre = MUSSymbol(name: "genre", code: 0x7047656e, type: typeType) // "pGen"
    public static let GIFPicture = MUSSymbol(name: "GIFPicture", code: 0x47494666, type: typeType) // "GIFf"
    public static let graphicText = MUSSymbol(name: "graphicText", code: 0x63677478, type: typeType) // "cgtx"
    public static let grouping = MUSSymbol(name: "grouping", code: 0x70477270, type: typeType) // "pGrp"
    public static let id = MUSSymbol(name: "id", code: 0x49442020, type: typeType) // "ID  "
    public static let index = MUSSymbol(name: "index", code: 0x70696478, type: typeType) // "pidx"
    public static let integer = MUSSymbol(name: "integer", code: 0x6c6f6e67, type: typeType) // "long"
    public static let internationalText = MUSSymbol(name: "internationalText", code: 0x69747874, type: typeType) // "itxt"
    public static let internationalWritingCode = MUSSymbol(name: "internationalWritingCode", code: 0x696e746c, type: typeType) // "intl"
    public static let item = MUSSymbol(name: "item", code: 0x636f626a, type: typeType) // "cobj"
    public static let January = MUSSymbol(name: "January", code: 0x6a616e20, type: typeType) // "jan "
    public static let JPEGPicture = MUSSymbol(name: "JPEGPicture", code: 0x4a504547, type: typeType) // "JPEG"
    public static let July = MUSSymbol(name: "July", code: 0x6a756c20, type: typeType) // "jul "
    public static let June = MUSSymbol(name: "June", code: 0x6a756e20, type: typeType) // "jun "
    public static let kernelProcessID = MUSSymbol(name: "kernelProcessID", code: 0x6b706964, type: typeType) // "kpid"
    public static let kind = MUSSymbol(name: "kind", code: 0x704b6e64, type: typeType) // "pKnd"
    public static let largeReal = MUSSymbol(name: "largeReal", code: 0x6c64626c, type: typeType) // "ldbl"
    public static let libraryPlaylist = MUSSymbol(name: "libraryPlaylist", code: 0x634c6950, type: typeType) // "cLiP"
    public static let list = MUSSymbol(name: "list", code: 0x6c697374, type: typeType) // "list"
    public static let location = MUSSymbol(name: "location", code: 0x704c6f63, type: typeType) // "pLoc"
    public static let locationReference = MUSSymbol(name: "locationReference", code: 0x696e736c, type: typeType) // "insl"
    public static let longDescription = MUSSymbol(name: "longDescription", code: 0x704c6473, type: typeType) // "pLds"
    public static let longFixed = MUSSymbol(name: "longFixed", code: 0x6c667864, type: typeType) // "lfxd"
    public static let longFixedPoint = MUSSymbol(name: "longFixedPoint", code: 0x6c667074, type: typeType) // "lfpt"
    public static let longFixedRectangle = MUSSymbol(name: "longFixedRectangle", code: 0x6c667263, type: typeType) // "lfrc"
    public static let longPoint = MUSSymbol(name: "longPoint", code: 0x6c706e74, type: typeType) // "lpnt"
    public static let longRectangle = MUSSymbol(name: "longRectangle", code: 0x6c726374, type: typeType) // "lrct"
    public static let lyrics = MUSSymbol(name: "lyrics", code: 0x704c7972, type: typeType) // "pLyr"
    public static let machine = MUSSymbol(name: "machine", code: 0x6d616368, type: typeType) // "mach"
    public static let machineLocation = MUSSymbol(name: "machineLocation", code: 0x6d4c6f63, type: typeType) // "mLoc"
    public static let machPort = MUSSymbol(name: "machPort", code: 0x706f7274, type: typeType) // "port"
    public static let March = MUSSymbol(name: "March", code: 0x6d617220, type: typeType) // "mar "
    public static let May = MUSSymbol(name: "May", code: 0x6d617920, type: typeType) // "may "
    public static let mediaKind = MUSSymbol(name: "mediaKind", code: 0x704d644b, type: typeType) // "pMdK"
    public static let miniplayerWindow = MUSSymbol(name: "miniplayerWindow", code: 0x634d5057, type: typeType) // "cMPW"
    public static let modifiable = MUSSymbol(name: "modifiable", code: 0x704d6f64, type: typeType) // "pMod"
    public static let modificationDate = MUSSymbol(name: "modificationDate", code: 0x61736d6f, type: typeType) // "asmo"
    public static let Monday = MUSSymbol(name: "Monday", code: 0x6d6f6e20, type: typeType) // "mon "
    public static let movement = MUSSymbol(name: "movement", code: 0x704d4e6d, type: typeType) // "pMNm"
    public static let movementCount = MUSSymbol(name: "movementCount", code: 0x704d7643, type: typeType) // "pMvC"
    public static let movementNumber = MUSSymbol(name: "movementNumber", code: 0x704d764e, type: typeType) // "pMvN"
    public static let mute = MUSSymbol(name: "mute", code: 0x704d7574, type: typeType) // "pMut"
    public static let name = MUSSymbol(name: "name", code: 0x706e616d, type: typeType) // "pnam"
    public static let networkAddress = MUSSymbol(name: "networkAddress", code: 0x704d4143, type: typeType) // "pMAC"
    public static let November = MUSSymbol(name: "November", code: 0x6e6f7620, type: typeType) // "nov "
    public static let null = MUSSymbol(name: "null", code: 0x6e756c6c, type: typeType) // "null"
    public static let October = MUSSymbol(name: "October", code: 0x6f637420, type: typeType) // "oct "
    public static let pagesAcross = MUSSymbol(name: "pagesAcross", code: 0x6c776c61, type: typeType) // "lwla"
    public static let pagesDown = MUSSymbol(name: "pagesDown", code: 0x6c776c64, type: typeType) // "lwld"
    public static let parent = MUSSymbol(name: "parent", code: 0x70506c50, type: typeType) // "pPlP"
    public static let persistentID = MUSSymbol(name: "persistentID", code: 0x70504953, type: typeType) // "pPIS"
    public static let PICTPicture = MUSSymbol(name: "PICTPicture", code: 0x50494354, type: typeType) // "PICT"
    public static let picture = MUSSymbol(name: "picture", code: 0x50494354, type: typeType) // "PICT"
    public static let pixelMapRecord = MUSSymbol(name: "pixelMapRecord", code: 0x74706d6d, type: typeType) // "tpmm"
    public static let playedCount = MUSSymbol(name: "playedCount", code: 0x70506c43, type: typeType) // "pPlC"
    public static let playedDate = MUSSymbol(name: "playedDate", code: 0x70506c44, type: typeType) // "pPlD"
    public static let playerPosition = MUSSymbol(name: "playerPosition", code: 0x70506f73, type: typeType) // "pPos"
    public static let playerState = MUSSymbol(name: "playerState", code: 0x70506c53, type: typeType) // "pPlS"
    public static let playlist = MUSSymbol(name: "playlist", code: 0x63506c79, type: typeType) // "cPly"
    public static let playlistWindow = MUSSymbol(name: "playlistWindow", code: 0x63506c57, type: typeType) // "cPlW"
    public static let point = MUSSymbol(name: "point", code: 0x51447074, type: typeType) // "QDpt"
    public static let position = MUSSymbol(name: "position", code: 0x70706f73, type: typeType) // "ppos"
    public static let preamp = MUSSymbol(name: "preamp", code: 0x70455141, type: typeType) // "pEQA"
    public static let printerFeatures = MUSSymbol(name: "printerFeatures", code: 0x6c777066, type: typeType) // "lwpf"
    public static let printSettings = MUSSymbol(name: "printSettings", code: 0x70736574, type: typeType) // "pset"
    public static let processSerialNumber = MUSSymbol(name: "processSerialNumber", code: 0x70736e20, type: typeType) // "psn "
    public static let properties = MUSSymbol(name: "properties", code: 0x70414c4c, type: typeType) // "pALL"
    public static let property_ = MUSSymbol(name: "property_", code: 0x70726f70, type: typeType) // "prop"
    public static let protected = MUSSymbol(name: "protected", code: 0x7050726f, type: typeType) // "pPro"
    public static let purchaserAccount = MUSSymbol(name: "purchaserAccount", code: 0x70504149, type: typeType) // "pPAI"
    public static let purchaserName = MUSSymbol(name: "purchaserName", code: 0x70504e6d, type: typeType) // "pPNm"
    public static let radioTunerPlaylist = MUSSymbol(name: "radioTunerPlaylist", code: 0x63525450, type: typeType) // "cRTP"
    public static let rating = MUSSymbol(name: "rating", code: 0x70527465, type: typeType) // "pRte"
    public static let ratingKind = MUSSymbol(name: "ratingKind", code: 0x7052746b, type: typeType) // "pRtk"
    public static let rawData = MUSSymbol(name: "rawData", code: 0x70526177, type: typeType) // "pRaw"
    public static let real = MUSSymbol(name: "real", code: 0x646f7562, type: typeType) // "doub"
    public static let record = MUSSymbol(name: "record", code: 0x7265636f, type: typeType) // "reco"
    public static let reference = MUSSymbol(name: "reference", code: 0x6f626a20, type: typeType) // "obj "
    public static let releaseDate = MUSSymbol(name: "releaseDate", code: 0x70526c44, type: typeType) // "pRlD"
    public static let requestedPrintTime = MUSSymbol(name: "requestedPrintTime", code: 0x6c777174, type: typeType) // "lwqt"
    public static let resizable = MUSSymbol(name: "resizable", code: 0x7072737a, type: typeType) // "prsz"
    public static let RGB16Color = MUSSymbol(name: "RGB16Color", code: 0x74723136, type: typeType) // "tr16"
    public static let RGB96Color = MUSSymbol(name: "RGB96Color", code: 0x74723936, type: typeType) // "tr96"
    public static let RGBColor = MUSSymbol(name: "RGBColor", code: 0x63524742, type: typeType) // "cRGB"
    public static let rotation = MUSSymbol(name: "rotation", code: 0x74726f74, type: typeType) // "trot"
    public static let sampleRate = MUSSymbol(name: "sampleRate", code: 0x70535274, type: typeType) // "pSRt"
    public static let Saturday = MUSSymbol(name: "Saturday", code: 0x73617420, type: typeType) // "sat "
    public static let script = MUSSymbol(name: "script", code: 0x73637074, type: typeType) // "scpt"
    public static let seasonNumber = MUSSymbol(name: "seasonNumber", code: 0x7053654e, type: typeType) // "pSeN"
    public static let selected = MUSSymbol(name: "selected", code: 0x73656c63, type: typeType) // "selc"
    public static let selection = MUSSymbol(name: "selection", code: 0x73656c65, type: typeType) // "sele"
    public static let September = MUSSymbol(name: "September", code: 0x73657020, type: typeType) // "sep "
    public static let shared = MUSSymbol(name: "shared", code: 0x70536872, type: typeType) // "pShr"
    public static let sharedTrack = MUSSymbol(name: "sharedTrack", code: 0x63536854, type: typeType) // "cShT"
    public static let shortInteger = MUSSymbol(name: "shortInteger", code: 0x73686f72, type: typeType) // "shor"
    public static let show = MUSSymbol(name: "show", code: 0x70536877, type: typeType) // "pShw"
    public static let shufflable = MUSSymbol(name: "shufflable", code: 0x70536661, type: typeType) // "pSfa"
    public static let shuffleEnabled = MUSSymbol(name: "shuffleEnabled", code: 0x70536845, type: typeType) // "pShE"
    public static let shuffleMode = MUSSymbol(name: "shuffleMode", code: 0x7053684d, type: typeType) // "pShM"
    public static let size = MUSSymbol(name: "size", code: 0x7053697a, type: typeType) // "pSiz"
    public static let skippedCount = MUSSymbol(name: "skippedCount", code: 0x70536b43, type: typeType) // "pSkC"
    public static let skippedDate = MUSSymbol(name: "skippedDate", code: 0x70536b44, type: typeType) // "pSkD"
    public static let smallReal = MUSSymbol(name: "smallReal", code: 0x73696e67, type: typeType) // "sing"
    public static let smart = MUSSymbol(name: "smart", code: 0x70536d74, type: typeType) // "pSmt"
    public static let songRepeat = MUSSymbol(name: "songRepeat", code: 0x70527074, type: typeType) // "pRpt"
    public static let sortAlbum = MUSSymbol(name: "sortAlbum", code: 0x7053416c, type: typeType) // "pSAl"
    public static let sortAlbumArtist = MUSSymbol(name: "sortAlbumArtist", code: 0x70534141, type: typeType) // "pSAA"
    public static let sortArtist = MUSSymbol(name: "sortArtist", code: 0x70534172, type: typeType) // "pSAr"
    public static let sortComposer = MUSSymbol(name: "sortComposer", code: 0x7053436d, type: typeType) // "pSCm"
    public static let sortName = MUSSymbol(name: "sortName", code: 0x70534e6d, type: typeType) // "pSNm"
    public static let sortShow = MUSSymbol(name: "sortShow", code: 0x7053534e, type: typeType) // "pSSN"
    public static let soundVolume = MUSSymbol(name: "soundVolume", code: 0x70566f6c, type: typeType) // "pVol"
    public static let source = MUSSymbol(name: "source", code: 0x63537263, type: typeType) // "cSrc"
    public static let specialKind = MUSSymbol(name: "specialKind", code: 0x7053704b, type: typeType) // "pSpK"
    public static let start = MUSSymbol(name: "start", code: 0x70537472, type: typeType) // "pStr"
    public static let startingPage = MUSSymbol(name: "startingPage", code: 0x6c776670, type: typeType) // "lwfp"
    public static let string = MUSSymbol(name: "string", code: 0x54455854, type: typeType) // "TEXT"
    public static let styledClipboardText = MUSSymbol(name: "styledClipboardText", code: 0x7374796c, type: typeType) // "styl"
    public static let styledText = MUSSymbol(name: "styledText", code: 0x53545854, type: typeType) // "STXT"
    public static let subscriptionPlaylist = MUSSymbol(name: "subscriptionPlaylist", code: 0x63537550, type: typeType) // "cSuP"
    public static let Sunday = MUSSymbol(name: "Sunday", code: 0x73756e20, type: typeType) // "sun "
    public static let supportsAudio = MUSSymbol(name: "supportsAudio", code: 0x70417564, type: typeType) // "pAud"
    public static let supportsVideo = MUSSymbol(name: "supportsVideo", code: 0x70566964, type: typeType) // "pVid"
    public static let targetPrinter = MUSSymbol(name: "targetPrinter", code: 0x74727072, type: typeType) // "trpr"
    public static let textStyleInfo = MUSSymbol(name: "textStyleInfo", code: 0x74737479, type: typeType) // "tsty"
    public static let Thursday = MUSSymbol(name: "Thursday", code: 0x74687520, type: typeType) // "thu "
    public static let TIFFPicture = MUSSymbol(name: "TIFFPicture", code: 0x54494646, type: typeType) // "TIFF"
    public static let time = MUSSymbol(name: "time", code: 0x7054696d, type: typeType) // "pTim"
    public static let track = MUSSymbol(name: "track", code: 0x6354726b, type: typeType) // "cTrk"
    public static let trackCount = MUSSymbol(name: "trackCount", code: 0x70547243, type: typeType) // "pTrC"
    public static let trackNumber = MUSSymbol(name: "trackNumber", code: 0x7054724e, type: typeType) // "pTrN"
    public static let Tuesday = MUSSymbol(name: "Tuesday", code: 0x74756520, type: typeType) // "tue "
    public static let typeClass = MUSSymbol(name: "typeClass", code: 0x74797065, type: typeType) // "type"
    public static let UnicodeText = MUSSymbol(name: "UnicodeText", code: 0x75747874, type: typeType) // "utxt"
    public static let unplayed = MUSSymbol(name: "unplayed", code: 0x70556e70, type: typeType) // "pUnp"
    public static let unsignedDoubleInteger = MUSSymbol(name: "unsignedDoubleInteger", code: 0x75636f6d, type: typeType) // "ucom"
    public static let unsignedInteger = MUSSymbol(name: "unsignedInteger", code: 0x6d61676e, type: typeType) // "magn"
    public static let unsignedShortInteger = MUSSymbol(name: "unsignedShortInteger", code: 0x75736872, type: typeType) // "ushr"
    public static let updateTracks = MUSSymbol(name: "updateTracks", code: 0x70555443, type: typeType) // "pUTC"
    public static let URLTrack = MUSSymbol(name: "URLTrack", code: 0x63555254, type: typeType) // "cURT"
    public static let userPlaylist = MUSSymbol(name: "userPlaylist", code: 0x63557350, type: typeType) // "cUsP"
    public static let UTF16Text = MUSSymbol(name: "UTF16Text", code: 0x75743136, type: typeType) // "ut16"
    public static let UTF8Text = MUSSymbol(name: "UTF8Text", code: 0x75746638, type: typeType) // "utf8"
    public static let version = MUSSymbol(name: "version", code: 0x76657273, type: typeType) // "vers"
    public static let videoWindow = MUSSymbol(name: "videoWindow", code: 0x634e5057, type: typeType) // "cNPW"
    public static let view = MUSSymbol(name: "view", code: 0x70506c79, type: typeType) // "pPly"
    public static let visible = MUSSymbol(name: "visible", code: 0x70766973, type: typeType) // "pvis"
    public static let visual = MUSSymbol(name: "visual", code: 0x63566973, type: typeType) // "cVis"
    public static let visualsEnabled = MUSSymbol(name: "visualsEnabled", code: 0x70567345, type: typeType) // "pVsE"
    public static let volumeAdjustment = MUSSymbol(name: "volumeAdjustment", code: 0x7041646a, type: typeType) // "pAdj"
    public static let Wednesday = MUSSymbol(name: "Wednesday", code: 0x77656420, type: typeType) // "wed "
    public static let window = MUSSymbol(name: "window", code: 0x6377696e, type: typeType) // "cwin"
    public static let work = MUSSymbol(name: "work", code: 0x7057726b, type: typeType) // "pWrk"
    public static let writingCode = MUSSymbol(name: "writingCode", code: 0x70736374, type: typeType) // "psct"
    public static let year = MUSSymbol(name: "year", code: 0x70597220, type: typeType) // "pYr "
    public static let zoomable = MUSSymbol(name: "zoomable", code: 0x69737a6d, type: typeType) // "iszm"
    public static let zoomed = MUSSymbol(name: "zoomed", code: 0x707a756d, type: typeType) // "pzum"

    // Enumerators
    public static let AirPortExpress = MUSSymbol(name: "AirPortExpress", code: 0x6b415058, type: typeEnumerated) // "kAPX"
    public static let albumListing = MUSSymbol(name: "albumListing", code: 0x6b416c62, type: typeEnumerated) // "kAlb"
    public static let albums = MUSSymbol(name: "albums", code: 0x6b536841, type: typeEnumerated) // "kShA"
    public static let all_ = MUSSymbol(name: "all_", code: 0x6b416c6c, type: typeEnumerated) // "kAll"
    public static let AppleTV = MUSSymbol(name: "AppleTV", code: 0x6b415054, type: typeEnumerated) // "kAPT"
    public static let artists = MUSSymbol(name: "artists", code: 0x6b537252, type: typeEnumerated) // "kSrR"
    public static let ask = MUSSymbol(name: "ask", code: 0x61736b20, type: typeEnumerated) // "ask "
    public static let audioCD = MUSSymbol(name: "audioCD", code: 0x6b414344, type: typeEnumerated) // "kACD"
    public static let BluetoothDevice = MUSSymbol(name: "BluetoothDevice", code: 0x6b415042, type: typeEnumerated) // "kAPB"
    public static let case_ = MUSSymbol(name: "case_", code: 0x63617365, type: typeEnumerated) // "case"
    public static let cdInsert = MUSSymbol(name: "cdInsert", code: 0x6b434469, type: typeEnumerated) // "kCDi"
    public static let composers = MUSSymbol(name: "composers", code: 0x6b537243, type: typeEnumerated) // "kSrC"
    public static let computed = MUSSymbol(name: "computed", code: 0x6b527443, type: typeEnumerated) // "kRtC"
    public static let computer = MUSSymbol(name: "computer", code: 0x6b415043, type: typeEnumerated) // "kAPC"
    public static let detailed = MUSSymbol(name: "detailed", code: 0x6c776474, type: typeEnumerated) // "lwdt"
    public static let diacriticals = MUSSymbol(name: "diacriticals", code: 0x64696163, type: typeEnumerated) // "diac"
    public static let displayed = MUSSymbol(name: "displayed", code: 0x6b537256, type: typeEnumerated) // "kSrV"
    public static let duplicate = MUSSymbol(name: "duplicate", code: 0x6b447570, type: typeEnumerated) // "kDup"
    public static let error = MUSSymbol(name: "error", code: 0x6b457272, type: typeEnumerated) // "kErr"
    public static let expansion = MUSSymbol(name: "expansion", code: 0x65787061, type: typeEnumerated) // "expa"
    public static let fastForwarding = MUSSymbol(name: "fastForwarding", code: 0x6b505346, type: typeEnumerated) // "kPSF"
    public static let folder = MUSSymbol(name: "folder", code: 0x6b537046, type: typeEnumerated) // "kSpF"
    public static let Genius = MUSSymbol(name: "Genius", code: 0x6b537047, type: typeEnumerated) // "kSpG"
    public static let groupings = MUSSymbol(name: "groupings", code: 0x6b536847, type: typeEnumerated) // "kShG"
    public static let HomePod = MUSSymbol(name: "HomePod", code: 0x6b415048, type: typeEnumerated) // "kAPH"
    public static let hyphens = MUSSymbol(name: "hyphens", code: 0x68797068, type: typeEnumerated) // "hyph"
    public static let ineligible = MUSSymbol(name: "ineligible", code: 0x6b52656a, type: typeEnumerated) // "kRej"
    public static let iTunesStore = MUSSymbol(name: "iTunesStore", code: 0x6b495453, type: typeEnumerated) // "kITS"
    public static let library = MUSSymbol(name: "library", code: 0x6b4c6962, type: typeEnumerated) // "kLib"
    public static let Library = MUSSymbol(name: "Library", code: 0x6b53704c, type: typeEnumerated) // "kSpL"
    public static let M3U = MUSSymbol(name: "M3U", code: 0x6b4d3355, type: typeEnumerated) // "kM3U"
    public static let M3U8 = MUSSymbol(name: "M3U8", code: 0x6b4d3338, type: typeEnumerated) // "kM38"
    public static let matched = MUSSymbol(name: "matched", code: 0x6b4d6174, type: typeEnumerated) // "kMat"
    public static let movie = MUSSymbol(name: "movie", code: 0x6b56644d, type: typeEnumerated) // "kVdM"
    public static let MP3CD = MUSSymbol(name: "MP3CD", code: 0x6b4d4344, type: typeEnumerated) // "kMCD"
    public static let Music = MUSSymbol(name: "Music", code: 0x6b53705a, type: typeEnumerated) // "kSpZ"
    public static let musicVideo = MUSSymbol(name: "musicVideo", code: 0x6b566456, type: typeEnumerated) // "kVdV"
    public static let names = MUSSymbol(name: "names", code: 0x6b537253, type: typeEnumerated) // "kSrS"
    public static let no = MUSSymbol(name: "no", code: 0x6e6f2020, type: typeEnumerated) // "no  "
    public static let noLongerAvailable = MUSSymbol(name: "noLongerAvailable", code: 0x6b526576, type: typeEnumerated) // "kRev"
    public static let none = MUSSymbol(name: "none", code: 0x6b4e6f6e, type: typeEnumerated) // "kNon"
    public static let notUploaded = MUSSymbol(name: "notUploaded", code: 0x6b557050, type: typeEnumerated) // "kUpP"
    public static let numericStrings = MUSSymbol(name: "numericStrings", code: 0x6e756d65, type: typeEnumerated) // "nume"
    public static let off = MUSSymbol(name: "off", code: 0x6b52704f, type: typeEnumerated) // "kRpO"
    public static let one = MUSSymbol(name: "one", code: 0x6b527031, type: typeEnumerated) // "kRp1"
    public static let paused = MUSSymbol(name: "paused", code: 0x6b505370, type: typeEnumerated) // "kPSp"
    public static let plainText = MUSSymbol(name: "plainText", code: 0x6b545854, type: typeEnumerated) // "kTXT"
    public static let playing = MUSSymbol(name: "playing", code: 0x6b505350, type: typeEnumerated) // "kPSP"
    public static let prerelease = MUSSymbol(name: "prerelease", code: 0x6b507252, type: typeEnumerated) // "kPrR"
    public static let punctuation = MUSSymbol(name: "punctuation", code: 0x70756e63, type: typeEnumerated) // "punc"
    public static let purchased = MUSSymbol(name: "purchased", code: 0x6b507572, type: typeEnumerated) // "kPur"
    public static let PurchasedMusic = MUSSymbol(name: "PurchasedMusic", code: 0x6b53704d, type: typeEnumerated) // "kSpM"
    public static let radioTuner = MUSSymbol(name: "radioTuner", code: 0x6b54756e, type: typeEnumerated) // "kTun"
    public static let removed = MUSSymbol(name: "removed", code: 0x6b52656d, type: typeEnumerated) // "kRem"
    public static let rewinding = MUSSymbol(name: "rewinding", code: 0x6b505352, type: typeEnumerated) // "kPSR"
    public static let sharedLibrary = MUSSymbol(name: "sharedLibrary", code: 0x6b536864, type: typeEnumerated) // "kShd"
    public static let song = MUSSymbol(name: "song", code: 0x6b4d6453, type: typeEnumerated) // "kMdS"
    public static let songs = MUSSymbol(name: "songs", code: 0x6b536853, type: typeEnumerated) // "kShS"
    public static let standard = MUSSymbol(name: "standard", code: 0x6c777374, type: typeEnumerated) // "lwst"
    public static let stopped = MUSSymbol(name: "stopped", code: 0x6b505353, type: typeEnumerated) // "kPSS"
    public static let subscription = MUSSymbol(name: "subscription", code: 0x6b537562, type: typeEnumerated) // "kSub"
    public static let trackListing = MUSSymbol(name: "trackListing", code: 0x6b54726b, type: typeEnumerated) // "kTrk"
    public static let TV = MUSSymbol(name: "TV", code: 0x6b415056, type: typeEnumerated) // "kAPV"
    public static let TVShow = MUSSymbol(name: "TVShow", code: 0x6b566454, type: typeEnumerated) // "kVdT"
    public static let UnicodeText_ = MUSSymbol(name: "UnicodeText_", code: 0x6b554354, type: typeEnumerated) // "kUCT"
    public static let unknown = MUSSymbol(name: "unknown", code: 0x6b556e6b, type: typeEnumerated) // "kUnk"
    public static let uploaded = MUSSymbol(name: "uploaded", code: 0x6b55706c, type: typeEnumerated) // "kUpl"
    public static let user = MUSSymbol(name: "user", code: 0x6b527455, type: typeEnumerated) // "kRtU"
    public static let whitespace = MUSSymbol(name: "whitespace", code: 0x77686974, type: typeEnumerated) // "whit"
    public static let XML = MUSSymbol(name: "XML", code: 0x6b584d4c, type: typeEnumerated) // "kXML"
    public static let yes = MUSSymbol(name: "yes", code: 0x79657320, type: typeEnumerated) // "yes "
}

public typealias MUS = MUSSymbol // allows symbols to be written as (e.g.) MUS.name instead of MUSSymbol.name


/******************************************************************************/
// Specifier extensions; these add command methods and property/elements getters based on Music.app terminology

public protocol MUSCommand: SwiftAutomation.SpecifierProtocol {} // provides AE dispatch methods

// Command->Any will be bound when return type can't be inferred, else Command->T

extension MUSCommand {
    @discardableResult public func activate(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "activate", event: 0x6d697363_61637476, // "miscactv"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func activate<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "activate", event: 0x6d697363_61637476, // "miscactv"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func add(_ directParameter: Any = SwiftAutomation.noParameter,
            to: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "add", event: 0x686f6f6b_41646420, // "hookAdd "
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("to", 0x696e7368, to), // "insh"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func add<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            to: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "add", event: 0x686f6f6b_41646420, // "hookAdd "
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("to", 0x696e7368, to), // "insh"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func backTrack(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "backTrack", event: 0x686f6f6b_4261636b, // "hookBack"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func backTrack<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "backTrack", event: 0x686f6f6b_4261636b, // "hookBack"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func close(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "close", event: 0x636f7265_636c6f73, // "coreclos"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func close<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "close", event: 0x636f7265_636c6f73, // "coreclos"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func convert(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "convert", event: 0x686f6f6b_436f6e76, // "hookConv"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func convert<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "convert", event: 0x686f6f6b_436f6e76, // "hookConv"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func count(_ directParameter: Any = SwiftAutomation.noParameter,
            each: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "count", event: 0x636f7265_636e7465, // "corecnte"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("each", 0x6b6f636c, each), // "kocl"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func count<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            each: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "count", event: 0x636f7265_636e7465, // "corecnte"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("each", 0x6b6f636c, each), // "kocl"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func delete(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "delete", event: 0x636f7265_64656c6f, // "coredelo"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func delete<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "delete", event: 0x636f7265_64656c6f, // "coredelo"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func download(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "download", event: 0x686f6f6b_44776e6c, // "hookDwnl"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func download<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "download", event: 0x686f6f6b_44776e6c, // "hookDwnl"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func duplicate(_ directParameter: Any = SwiftAutomation.noParameter,
            to: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "duplicate", event: 0x636f7265_636c6f6e, // "coreclon"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("to", 0x696e7368, to), // "insh"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func duplicate<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            to: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "duplicate", event: 0x636f7265_636c6f6e, // "coreclon"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("to", 0x696e7368, to), // "insh"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func exists(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "exists", event: 0x636f7265_646f6578, // "coredoex"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func exists<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "exists", event: 0x636f7265_646f6578, // "coredoex"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func export(_ directParameter: Any = SwiftAutomation.noParameter,
            as_: Any = SwiftAutomation.noParameter,
            to: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "export", event: 0x686f6f6b_45787074, // "hookExpt"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("as_", 0x70457846, as_), // "pExF"
                    ("to", 0x696e7368, to), // "insh"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func export<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            as_: Any = SwiftAutomation.noParameter,
            to: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "export", event: 0x686f6f6b_45787074, // "hookExpt"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("as_", 0x70457846, as_), // "pExF"
                    ("to", 0x696e7368, to), // "insh"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func fastForward(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "fastForward", event: 0x686f6f6b_46617374, // "hookFast"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func fastForward<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "fastForward", event: 0x686f6f6b_46617374, // "hookFast"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func get(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "get", event: 0x636f7265_67657464, // "coregetd"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func get<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "get", event: 0x636f7265_67657464, // "coregetd"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func make(_ directParameter: Any = SwiftAutomation.noParameter,
            new: Any = SwiftAutomation.noParameter,
            at: Any = SwiftAutomation.noParameter,
            withProperties: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "make", event: 0x636f7265_6372656c, // "corecrel"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("new", 0x6b6f636c, new), // "kocl"
                    ("at", 0x696e7368, at), // "insh"
                    ("withProperties", 0x70726474, withProperties), // "prdt"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func make<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            new: Any = SwiftAutomation.noParameter,
            at: Any = SwiftAutomation.noParameter,
            withProperties: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "make", event: 0x636f7265_6372656c, // "corecrel"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("new", 0x6b6f636c, new), // "kocl"
                    ("at", 0x696e7368, at), // "insh"
                    ("withProperties", 0x70726474, withProperties), // "prdt"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func move(_ directParameter: Any = SwiftAutomation.noParameter,
            to: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "move", event: 0x636f7265_6d6f7665, // "coremove"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("to", 0x696e7368, to), // "insh"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func move<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            to: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "move", event: 0x636f7265_6d6f7665, // "coremove"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("to", 0x696e7368, to), // "insh"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func nextTrack(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "nextTrack", event: 0x686f6f6b_4e657874, // "hookNext"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func nextTrack<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "nextTrack", event: 0x686f6f6b_4e657874, // "hookNext"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func open(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "open", event: 0x61657674_6f646f63, // "aevtodoc"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func open<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "open", event: 0x61657674_6f646f63, // "aevtodoc"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func openLocation(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "openLocation", event: 0x4755524c_4755524c, // "GURLGURL"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func openLocation<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "openLocation", event: 0x4755524c_4755524c, // "GURLGURL"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func pause(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "pause", event: 0x686f6f6b_50617573, // "hookPaus"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func pause<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "pause", event: 0x686f6f6b_50617573, // "hookPaus"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func play(_ directParameter: Any = SwiftAutomation.noParameter,
            once: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "play", event: 0x686f6f6b_506c6179, // "hookPlay"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("once", 0x504f6e65, once), // "POne"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func play<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            once: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "play", event: 0x686f6f6b_506c6179, // "hookPlay"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("once", 0x504f6e65, once), // "POne"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func playpause(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "playpause", event: 0x686f6f6b_506c5073, // "hookPlPs"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func playpause<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "playpause", event: 0x686f6f6b_506c5073, // "hookPlPs"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func previousTrack(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "previousTrack", event: 0x686f6f6b_50726576, // "hookPrev"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func previousTrack<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "previousTrack", event: 0x686f6f6b_50726576, // "hookPrev"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func print(_ directParameter: Any = SwiftAutomation.noParameter,
            printDialog: Any = SwiftAutomation.noParameter,
            withProperties: Any = SwiftAutomation.noParameter,
            kind: Any = SwiftAutomation.noParameter,
            theme: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "print", event: 0x61657674_70646f63, // "aevtpdoc"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("printDialog", 0x70646c67, printDialog), // "pdlg"
                    ("withProperties", 0x70726474, withProperties), // "prdt"
                    ("kind", 0x704b6e64, kind), // "pKnd"
                    ("theme", 0x7054686d, theme), // "pThm"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func print<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            printDialog: Any = SwiftAutomation.noParameter,
            withProperties: Any = SwiftAutomation.noParameter,
            kind: Any = SwiftAutomation.noParameter,
            theme: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "print", event: 0x61657674_70646f63, // "aevtpdoc"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("printDialog", 0x70646c67, printDialog), // "pdlg"
                    ("withProperties", 0x70726474, withProperties), // "prdt"
                    ("kind", 0x704b6e64, kind), // "pKnd"
                    ("theme", 0x7054686d, theme), // "pThm"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func quit(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "quit", event: 0x61657674_71756974, // "aevtquit"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func quit<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "quit", event: 0x61657674_71756974, // "aevtquit"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func refresh(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "refresh", event: 0x686f6f6b_52667273, // "hookRfrs"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func refresh<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "refresh", event: 0x686f6f6b_52667273, // "hookRfrs"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func reopen(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "reopen", event: 0x61657674_72617070, // "aevtrapp"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func reopen<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "reopen", event: 0x61657674_72617070, // "aevtrapp"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func resume(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "resume", event: 0x686f6f6b_52657375, // "hookResu"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func resume<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "resume", event: 0x686f6f6b_52657375, // "hookResu"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func reveal(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "reveal", event: 0x686f6f6b_5265766c, // "hookRevl"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func reveal<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "reveal", event: 0x686f6f6b_5265766c, // "hookRevl"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func rewind(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "rewind", event: 0x686f6f6b_52776e64, // "hookRwnd"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func rewind<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "rewind", event: 0x686f6f6b_52776e64, // "hookRwnd"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func run(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "run", event: 0x61657674_6f617070, // "aevtoapp"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func run<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "run", event: 0x61657674_6f617070, // "aevtoapp"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func save(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "save", event: 0x636f7265_73617665, // "coresave"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func save<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "save", event: 0x636f7265_73617665, // "coresave"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func search(_ directParameter: Any = SwiftAutomation.noParameter,
            for_: Any = SwiftAutomation.noParameter,
            only: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "search", event: 0x686f6f6b_53726368, // "hookSrch"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("for_", 0x7054726d, for_), // "pTrm"
                    ("only", 0x70417265, only), // "pAre"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func search<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            for_: Any = SwiftAutomation.noParameter,
            only: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "search", event: 0x686f6f6b_53726368, // "hookSrch"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("for_", 0x7054726d, for_), // "pTrm"
                    ("only", 0x70417265, only), // "pAre"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func select(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "select", event: 0x6d697363_736c6374, // "miscslct"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func select<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "select", event: 0x6d697363_736c6374, // "miscslct"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func set(_ directParameter: Any = SwiftAutomation.noParameter,
            to: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "set", event: 0x636f7265_73657464, // "coresetd"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("to", 0x64617461, to), // "data"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func set<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            to: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "set", event: 0x636f7265_73657464, // "coresetd"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("to", 0x64617461, to), // "data"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func stop(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "stop", event: 0x686f6f6b_53746f70, // "hookStop"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func stop<T>(_ directParameter: Any = SwiftAutomation.noParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "stop", event: 0x686f6f6b_53746f70, // "hookStop"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
}


public protocol MUSObject: SwiftAutomation.ObjectSpecifierExtension, MUSCommand {} // provides vars and methods for constructing specifiers

extension MUSObject {

    // Properties
    public var active: MUSItem {return self.property(0x70416374) as! MUSItem} // "pAct"
    public var address: MUSItem {return self.property(0x7055524c) as! MUSItem} // "pURL"
    public var AirPlayEnabled: MUSItem {return self.property(0x70415045) as! MUSItem} // "pAPE"
    public var album: MUSItem {return self.property(0x70416c62) as! MUSItem} // "pAlb"
    public var albumArtist: MUSItem {return self.property(0x70416c41) as! MUSItem} // "pAlA"
    public var albumDisliked: MUSItem {return self.property(0x70414874) as! MUSItem} // "pAHt"
    public var albumFavorited: MUSItem {return self.property(0x70414c76) as! MUSItem} // "pALv"
    public var albumRating: MUSItem {return self.property(0x70416c52) as! MUSItem} // "pAlR"
    public var albumRatingKind: MUSItem {return self.property(0x7041526b) as! MUSItem} // "pARk"
    public var artist: MUSItem {return self.property(0x70417274) as! MUSItem} // "pArt"
    public var available: MUSItem {return self.property(0x70417661) as! MUSItem} // "pAva"
    public var band1: MUSItem {return self.property(0x70455131) as! MUSItem} // "pEQ1"
    public var band10: MUSItem {return self.property(0x70455130) as! MUSItem} // "pEQ0"
    public var band2: MUSItem {return self.property(0x70455132) as! MUSItem} // "pEQ2"
    public var band3: MUSItem {return self.property(0x70455133) as! MUSItem} // "pEQ3"
    public var band4: MUSItem {return self.property(0x70455134) as! MUSItem} // "pEQ4"
    public var band5: MUSItem {return self.property(0x70455135) as! MUSItem} // "pEQ5"
    public var band6: MUSItem {return self.property(0x70455136) as! MUSItem} // "pEQ6"
    public var band7: MUSItem {return self.property(0x70455137) as! MUSItem} // "pEQ7"
    public var band8: MUSItem {return self.property(0x70455138) as! MUSItem} // "pEQ8"
    public var band9: MUSItem {return self.property(0x70455139) as! MUSItem} // "pEQ9"
    public var bitRate: MUSItem {return self.property(0x70425274) as! MUSItem} // "pBRt"
    public var bookmark: MUSItem {return self.property(0x70426b74) as! MUSItem} // "pBkt"
    public var bookmarkable: MUSItem {return self.property(0x70426b6d) as! MUSItem} // "pBkm"
    public var bounds: MUSItem {return self.property(0x70626e64) as! MUSItem} // "pbnd"
    public var bpm: MUSItem {return self.property(0x7042504d) as! MUSItem} // "pBPM"
    public var capacity: MUSItem {return self.property(0x63617061) as! MUSItem} // "capa"
    public var category: MUSItem {return self.property(0x70436174) as! MUSItem} // "pCat"
    public var class_: MUSItem {return self.property(0x70636c73) as! MUSItem} // "pcls"
    public var closeable: MUSItem {return self.property(0x68636c62) as! MUSItem} // "hclb"
    public var cloudStatus: MUSItem {return self.property(0x70436c53) as! MUSItem} // "pClS"
    public var collapseable: MUSItem {return self.property(0x70575368) as! MUSItem} // "pWSh"
    public var collapsed: MUSItem {return self.property(0x77736864) as! MUSItem} // "wshd"
    public var collating: MUSItem {return self.property(0x6c77636c) as! MUSItem} // "lwcl"
    public var comment: MUSItem {return self.property(0x70436d74) as! MUSItem} // "pCmt"
    public var compilation: MUSItem {return self.property(0x70416e74) as! MUSItem} // "pAnt"
    public var composer: MUSItem {return self.property(0x70436d70) as! MUSItem} // "pCmp"
    public var container: MUSItem {return self.property(0x63746e72) as! MUSItem} // "ctnr"
    public var converting: MUSItem {return self.property(0x70436e76) as! MUSItem} // "pCnv"
    public var copies: MUSItem {return self.property(0x6c776370) as! MUSItem} // "lwcp"
    public var currentAirPlayDevices: MUSItem {return self.property(0x70415044) as! MUSItem} // "pAPD"
    public var currentEncoder: MUSItem {return self.property(0x70456e63) as! MUSItem} // "pEnc"
    public var currentEQPreset: MUSItem {return self.property(0x70455150) as! MUSItem} // "pEQP"
    public var currentPlaylist: MUSItem {return self.property(0x70506c61) as! MUSItem} // "pPla"
    public var currentStreamTitle: MUSItem {return self.property(0x70537454) as! MUSItem} // "pStT"
    public var currentStreamURL: MUSItem {return self.property(0x70537455) as! MUSItem} // "pStU"
    public var currentTrack: MUSItem {return self.property(0x7054726b) as! MUSItem} // "pTrk"
    public var currentVisual: MUSItem {return self.property(0x70566973) as! MUSItem} // "pVis"
    public var data_: MUSItem {return self.property(0x70504354) as! MUSItem} // "pPCT"
    public var databaseID: MUSItem {return self.property(0x70444944) as! MUSItem} // "pDID"
    public var dateAdded: MUSItem {return self.property(0x70416464) as! MUSItem} // "pAdd"
    public var description_: MUSItem {return self.property(0x70446573) as! MUSItem} // "pDes"
    public var discCount: MUSItem {return self.property(0x70447343) as! MUSItem} // "pDsC"
    public var discNumber: MUSItem {return self.property(0x7044734e) as! MUSItem} // "pDsN"
    public var disliked: MUSItem {return self.property(0x70486174) as! MUSItem} // "pHat"
    public var downloaded: MUSItem {return self.property(0x70446c41) as! MUSItem} // "pDlA"
    public var downloaderAccount: MUSItem {return self.property(0x70444149) as! MUSItem} // "pDAI"
    public var downloaderName: MUSItem {return self.property(0x70444e6d) as! MUSItem} // "pDNm"
    public var duration: MUSItem {return self.property(0x70447572) as! MUSItem} // "pDur"
    public var enabled: MUSItem {return self.property(0x656e626c) as! MUSItem} // "enbl"
    public var endingPage: MUSItem {return self.property(0x6c776c70) as! MUSItem} // "lwlp"
    public var episodeID: MUSItem {return self.property(0x70457044) as! MUSItem} // "pEpD"
    public var episodeNumber: MUSItem {return self.property(0x7045704e) as! MUSItem} // "pEpN"
    public var EQ: MUSItem {return self.property(0x70455170) as! MUSItem} // "pEQp"
    public var EQEnabled: MUSItem {return self.property(0x70455120) as! MUSItem} // "pEQ "
    public var errorHandling: MUSItem {return self.property(0x6c776568) as! MUSItem} // "lweh"
    public var favorited: MUSItem {return self.property(0x704c6f76) as! MUSItem} // "pLov"
    public var faxNumber: MUSItem {return self.property(0x6661786e) as! MUSItem} // "faxn"
    public var finish: MUSItem {return self.property(0x70537470) as! MUSItem} // "pStp"
    public var fixedIndexing: MUSItem {return self.property(0x70466978) as! MUSItem} // "pFix"
    public var format: MUSItem {return self.property(0x70466d74) as! MUSItem} // "pFmt"
    public var freeSpace: MUSItem {return self.property(0x66727370) as! MUSItem} // "frsp"
    public var frontmost: MUSItem {return self.property(0x70697366) as! MUSItem} // "pisf"
    public var fullScreen: MUSItem {return self.property(0x70465363) as! MUSItem} // "pFSc"
    public var gapless: MUSItem {return self.property(0x7047706c) as! MUSItem} // "pGpl"
    public var genius: MUSItem {return self.property(0x70476e73) as! MUSItem} // "pGns"
    public var genre: MUSItem {return self.property(0x7047656e) as! MUSItem} // "pGen"
    public var grouping: MUSItem {return self.property(0x70477270) as! MUSItem} // "pGrp"
    public var id: MUSItem {return self.property(0x49442020) as! MUSItem} // "ID  "
    public var index: MUSItem {return self.property(0x70696478) as! MUSItem} // "pidx"
    public var kind: MUSItem {return self.property(0x704b6e64) as! MUSItem} // "pKnd"
    public var location: MUSItem {return self.property(0x704c6f63) as! MUSItem} // "pLoc"
    public var longDescription: MUSItem {return self.property(0x704c6473) as! MUSItem} // "pLds"
    public var lyrics: MUSItem {return self.property(0x704c7972) as! MUSItem} // "pLyr"
    public var mediaKind: MUSItem {return self.property(0x704d644b) as! MUSItem} // "pMdK"
    public var modifiable: MUSItem {return self.property(0x704d6f64) as! MUSItem} // "pMod"
    public var modificationDate: MUSItem {return self.property(0x61736d6f) as! MUSItem} // "asmo"
    public var movement: MUSItem {return self.property(0x704d4e6d) as! MUSItem} // "pMNm"
    public var movementCount: MUSItem {return self.property(0x704d7643) as! MUSItem} // "pMvC"
    public var movementNumber: MUSItem {return self.property(0x704d764e) as! MUSItem} // "pMvN"
    public var mute: MUSItem {return self.property(0x704d7574) as! MUSItem} // "pMut"
    public var name: MUSItem {return self.property(0x706e616d) as! MUSItem} // "pnam"
    public var networkAddress: MUSItem {return self.property(0x704d4143) as! MUSItem} // "pMAC"
    public var pagesAcross: MUSItem {return self.property(0x6c776c61) as! MUSItem} // "lwla"
    public var pagesDown: MUSItem {return self.property(0x6c776c64) as! MUSItem} // "lwld"
    public var parent: MUSItem {return self.property(0x70506c50) as! MUSItem} // "pPlP"
    public var persistentID: MUSItem {return self.property(0x70504953) as! MUSItem} // "pPIS"
    public var playedCount: MUSItem {return self.property(0x70506c43) as! MUSItem} // "pPlC"
    public var playedDate: MUSItem {return self.property(0x70506c44) as! MUSItem} // "pPlD"
    public var playerPosition: MUSItem {return self.property(0x70506f73) as! MUSItem} // "pPos"
    public var playerState: MUSItem {return self.property(0x70506c53) as! MUSItem} // "pPlS"
    public var position: MUSItem {return self.property(0x70706f73) as! MUSItem} // "ppos"
    public var preamp: MUSItem {return self.property(0x70455141) as! MUSItem} // "pEQA"
    public var printerFeatures: MUSItem {return self.property(0x6c777066) as! MUSItem} // "lwpf"
    public var properties: MUSItem {return self.property(0x70414c4c) as! MUSItem} // "pALL"
    public var protected: MUSItem {return self.property(0x7050726f) as! MUSItem} // "pPro"
    public var purchaserAccount: MUSItem {return self.property(0x70504149) as! MUSItem} // "pPAI"
    public var purchaserName: MUSItem {return self.property(0x70504e6d) as! MUSItem} // "pPNm"
    public var rating: MUSItem {return self.property(0x70527465) as! MUSItem} // "pRte"
    public var ratingKind: MUSItem {return self.property(0x7052746b) as! MUSItem} // "pRtk"
    public var rawData: MUSItem {return self.property(0x70526177) as! MUSItem} // "pRaw"
    public var releaseDate: MUSItem {return self.property(0x70526c44) as! MUSItem} // "pRlD"
    public var requestedPrintTime: MUSItem {return self.property(0x6c777174) as! MUSItem} // "lwqt"
    public var resizable: MUSItem {return self.property(0x7072737a) as! MUSItem} // "prsz"
    public var sampleRate: MUSItem {return self.property(0x70535274) as! MUSItem} // "pSRt"
    public var seasonNumber: MUSItem {return self.property(0x7053654e) as! MUSItem} // "pSeN"
    public var selected: MUSItem {return self.property(0x73656c63) as! MUSItem} // "selc"
    public var selection: MUSItem {return self.property(0x73656c65) as! MUSItem} // "sele"
    public var shared: MUSItem {return self.property(0x70536872) as! MUSItem} // "pShr"
    public var show: MUSItem {return self.property(0x70536877) as! MUSItem} // "pShw"
    public var shufflable: MUSItem {return self.property(0x70536661) as! MUSItem} // "pSfa"
    public var shuffleEnabled: MUSItem {return self.property(0x70536845) as! MUSItem} // "pShE"
    public var shuffleMode: MUSItem {return self.property(0x7053684d) as! MUSItem} // "pShM"
    public var size: MUSItem {return self.property(0x7053697a) as! MUSItem} // "pSiz"
    public var skippedCount: MUSItem {return self.property(0x70536b43) as! MUSItem} // "pSkC"
    public var skippedDate: MUSItem {return self.property(0x70536b44) as! MUSItem} // "pSkD"
    public var smart: MUSItem {return self.property(0x70536d74) as! MUSItem} // "pSmt"
    public var songRepeat: MUSItem {return self.property(0x70527074) as! MUSItem} // "pRpt"
    public var sortAlbum: MUSItem {return self.property(0x7053416c) as! MUSItem} // "pSAl"
    public var sortAlbumArtist: MUSItem {return self.property(0x70534141) as! MUSItem} // "pSAA"
    public var sortArtist: MUSItem {return self.property(0x70534172) as! MUSItem} // "pSAr"
    public var sortComposer: MUSItem {return self.property(0x7053436d) as! MUSItem} // "pSCm"
    public var sortName: MUSItem {return self.property(0x70534e6d) as! MUSItem} // "pSNm"
    public var sortShow: MUSItem {return self.property(0x7053534e) as! MUSItem} // "pSSN"
    public var soundVolume: MUSItem {return self.property(0x70566f6c) as! MUSItem} // "pVol"
    public var specialKind: MUSItem {return self.property(0x7053704b) as! MUSItem} // "pSpK"
    public var start: MUSItem {return self.property(0x70537472) as! MUSItem} // "pStr"
    public var startingPage: MUSItem {return self.property(0x6c776670) as! MUSItem} // "lwfp"
    public var supportsAudio: MUSItem {return self.property(0x70417564) as! MUSItem} // "pAud"
    public var supportsVideo: MUSItem {return self.property(0x70566964) as! MUSItem} // "pVid"
    public var targetPrinter: MUSItem {return self.property(0x74727072) as! MUSItem} // "trpr"
    public var time: MUSItem {return self.property(0x7054696d) as! MUSItem} // "pTim"
    public var trackCount: MUSItem {return self.property(0x70547243) as! MUSItem} // "pTrC"
    public var trackNumber: MUSItem {return self.property(0x7054724e) as! MUSItem} // "pTrN"
    public var unplayed: MUSItem {return self.property(0x70556e70) as! MUSItem} // "pUnp"
    public var updateTracks: MUSItem {return self.property(0x70555443) as! MUSItem} // "pUTC"
    public var version: MUSItem {return self.property(0x76657273) as! MUSItem} // "vers"
    public var view: MUSItem {return self.property(0x70506c79) as! MUSItem} // "pPly"
    public var visible: MUSItem {return self.property(0x70766973) as! MUSItem} // "pvis"
    public var visualsEnabled: MUSItem {return self.property(0x70567345) as! MUSItem} // "pVsE"
    public var volumeAdjustment: MUSItem {return self.property(0x7041646a) as! MUSItem} // "pAdj"
    public var work: MUSItem {return self.property(0x7057726b) as! MUSItem} // "pWrk"
    public var year: MUSItem {return self.property(0x70597220) as! MUSItem} // "pYr "
    public var zoomable: MUSItem {return self.property(0x69737a6d) as! MUSItem} // "iszm"
    public var zoomed: MUSItem {return self.property(0x707a756d) as! MUSItem} // "pzum"

    // Elements
    public var AirPlayDevices: MUSItems {return self.elements(0x63415044) as! MUSItems} // "cAPD"
    public var applications: MUSItems {return self.elements(0x63617070) as! MUSItems} // "capp"
    public var artworks: MUSItems {return self.elements(0x63417274) as! MUSItems} // "cArt"
    public var audioCDPlaylists: MUSItems {return self.elements(0x63434450) as! MUSItems} // "cCDP"
    public var audioCDTracks: MUSItems {return self.elements(0x63434454) as! MUSItems} // "cCDT"
    public var browserWindows: MUSItems {return self.elements(0x63427257) as! MUSItems} // "cBrW"
    public var encoders: MUSItems {return self.elements(0x63456e63) as! MUSItems} // "cEnc"
    public var EQPresets: MUSItems {return self.elements(0x63455150) as! MUSItems} // "cEQP"
    public var EQWindows: MUSItems {return self.elements(0x63455157) as! MUSItems} // "cEQW"
    public var fileTracks: MUSItems {return self.elements(0x63466c54) as! MUSItems} // "cFlT"
    public var folderPlaylists: MUSItems {return self.elements(0x63466f50) as! MUSItems} // "cFoP"
    public var items: MUSItems {return self.elements(0x636f626a) as! MUSItems} // "cobj"
    public var libraryPlaylists: MUSItems {return self.elements(0x634c6950) as! MUSItems} // "cLiP"
    public var miniplayerWindows: MUSItems {return self.elements(0x634d5057) as! MUSItems} // "cMPW"
    public var playlists: MUSItems {return self.elements(0x63506c79) as! MUSItems} // "cPly"
    public var playlistWindows: MUSItems {return self.elements(0x63506c57) as! MUSItems} // "cPlW"
    public var radioTunerPlaylists: MUSItems {return self.elements(0x63525450) as! MUSItems} // "cRTP"
    public var sharedTracks: MUSItems {return self.elements(0x63536854) as! MUSItems} // "cShT"
    public var sources: MUSItems {return self.elements(0x63537263) as! MUSItems} // "cSrc"
    public var subscriptionPlaylists: MUSItems {return self.elements(0x63537550) as! MUSItems} // "cSuP"
    public var tracks: MUSItems {return self.elements(0x6354726b) as! MUSItems} // "cTrk"
    public var URLTracks: MUSItems {return self.elements(0x63555254) as! MUSItems} // "cURT"
    public var userPlaylists: MUSItems {return self.elements(0x63557350) as! MUSItems} // "cUsP"
    public var videoWindows: MUSItems {return self.elements(0x634e5057) as! MUSItems} // "cNPW"
    public var visuals: MUSItems {return self.elements(0x63566973) as! MUSItems} // "cVis"
    public var windows: MUSItems {return self.elements(0x6377696e) as! MUSItems} // "cwin"
}


/******************************************************************************/
// Specifier subclasses add app-specific extensions

// beginning/end/before/after
public class MUSInsertion: SwiftAutomation.InsertionSpecifier, MUSCommand {}


// property/by-index/by-name/by-id/previous/next/first/middle/last/any
public class MUSItem: SwiftAutomation.ObjectSpecifier, MUSObject {
    public typealias InsertionSpecifierType = MUSInsertion
    public typealias ObjectSpecifierType = MUSItem
    public typealias MultipleObjectSpecifierType = MUSItems
}

// by-range/by-test/all
public class MUSItems: MUSItem, SwiftAutomation.MultipleObjectSpecifierExtension {}

// App/Con/Its
public class MUSRoot: SwiftAutomation.RootSpecifier, MUSObject, SwiftAutomation.RootSpecifierExtension {
    public typealias InsertionSpecifierType = MUSInsertion
    public typealias ObjectSpecifierType = MUSItem
    public typealias MultipleObjectSpecifierType = MUSItems
    public override class var untargetedAppData: SwiftAutomation.AppData { return _untargetedAppData }
}

// Application
public class Music: MUSRoot, SwiftAutomation.Application {
    public convenience init(launchOptions: SwiftAutomation.LaunchOptions = SwiftAutomation.defaultLaunchOptions, relaunchMode: SwiftAutomation.RelaunchMode = SwiftAutomation.defaultRelaunchMode) {
        self.init(rootObject: SwiftAutomation.appRootDesc, appData: Swift.type(of:self).untargetedAppData.targetedCopy(
                  .bundleIdentifier("com.apple.Music", true), launchOptions: launchOptions, relaunchMode: relaunchMode))
    }
}

// App/Con/Its root objects used to construct untargeted specifiers; these can be used to construct specifiers for use in commands, though cannot send commands themselves

public let MUSApp = _untargetedAppData.app as! MUSRoot
public let MUSCon = _untargetedAppData.con as! MUSRoot
public let MUSIts = _untargetedAppData.its as! MUSRoot


/******************************************************************************/
// Static types

public typealias MUSRecord = [MUSSymbol:Any] // default Swift type for AERecordDescs






