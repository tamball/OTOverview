import "../models/book_overview.dart";

/// 《讀聖經》概覽影片：依書卷 [OtBookRef.id] 對應，供書卷詳情使用（非整個分部列表）。
/// 摩西五經詳見各 `*_overview_data.dart`，此處不需條目。
const Map<String, List<OverviewVideoLink>> kOtBookOverviewVideosById = {
  // —— 歷史書 ——
  "joshua": [
    OverviewVideoLink(
      title: "約書亞記 Joshua",
      url: "https://www.youtube.com/watch?v=IFEK6lfc9nQ",
    ),
  ],
  "judges": [
    OverviewVideoLink(
      title: "士師記 Judges",
      url: "https://www.youtube.com/watch?v=-lC-Z9AQ-GY",
    ),
  ],
  "ruth": [
    OverviewVideoLink(
      title: "路得記 Ruth",
      url: "https://www.youtube.com/watch?v=p38YoZ7THz0",
    ),
  ],
  "1_samuel": [
    OverviewVideoLink(
      title: "撒母耳記上 1 Samuel",
      url: "https://www.youtube.com/watch?v=nBJUtByLPpM",
    ),
  ],
  "2_samuel": [
    OverviewVideoLink(
      title: "撒母耳記下 2 Samuel",
      url: "https://www.youtube.com/watch?v=NjRHWF6HPUc",
    ),
  ],
  "1_kings": [
    OverviewVideoLink(
      title: "列王紀上、下 1–2 Kings",
      url: "https://www.youtube.com/watch?v=O1JFu6KUYbI",
    ),
  ],
  "2_kings": [
    OverviewVideoLink(
      title: "列王紀上、下 1–2 Kings",
      url: "https://www.youtube.com/watch?v=O1JFu6KUYbI",
    ),
  ],
  "1_chronicles": [
    OverviewVideoLink(
      title: "歷代志上、下 1–2 Chronicles",
      url: "https://www.youtube.com/watch?v=xm2JacZAohc",
    ),
  ],
  "2_chronicles": [
    OverviewVideoLink(
      title: "歷代志上、下 1–2 Chronicles",
      url: "https://www.youtube.com/watch?v=xm2JacZAohc",
    ),
  ],
  "ezra": [
    OverviewVideoLink(
      title: "以斯拉記+尼希米記 Ezra–Nehemiah",
      url: "https://www.youtube.com/watch?v=n4LViN8Yrzo",
    ),
  ],
  "nehemiah": [
    OverviewVideoLink(
      title: "以斯拉記+尼希米記 Ezra–Nehemiah",
      url: "https://www.youtube.com/watch?v=n4LViN8Yrzo",
    ),
  ],
  "esther": [
    OverviewVideoLink(
      title: "以斯帖記 Esther",
      url: "https://www.youtube.com/watch?v=rNOdRXgRnbw",
    ),
  ],
  // —— 智慧文學 ——
  "job": [
    OverviewVideoLink(
      title: "約伯記 Job",
      url: "https://www.youtube.com/watch?v=1riXgorBEtY",
    ),
  ],
  "psalms": [
    OverviewVideoLink(
      title: "詩篇 Psalms",
      url: "https://www.youtube.com/watch?v=kzgtXbeandI",
    ),
  ],
  "proverbs": [
    OverviewVideoLink(
      title: "箴言 Proverbs",
      url: "https://www.youtube.com/watch?v=njXJoKxkBvU",
    ),
  ],
  "ecclesiastes": [
    OverviewVideoLink(
      title: "傳道書 Ecclesiastes",
      url: "https://www.youtube.com/watch?v=goIq3Zc8Az8",
    ),
  ],
  "song_of_songs": [
    OverviewVideoLink(
      title: "雅歌 Song of Songs",
      url: "https://www.youtube.com/watch?v=En8_2w6ZOkE",
    ),
  ],
  // —— 先知書 ——
  "isaiah": [
    OverviewVideoLink(
      title: "以賽亞書 上半 Isaiah 1–39",
      url: "https://www.youtube.com/watch?v=w2ePRvVZ51g",
    ),
    OverviewVideoLink(
      title: "以賽亞書 下半 Isaiah 40–66",
      url: "https://www.youtube.com/watch?v=444uVC_xt4g",
    ),
  ],
  "jeremiah": [
    OverviewVideoLink(
      title: "耶利米書 Jeremiah",
      url: "https://www.youtube.com/watch?v=y5iHS9jb99E",
    ),
  ],
  "lamentations": [
    OverviewVideoLink(
      title: "耶利米哀歌 Lamentations",
      url: "https://www.youtube.com/watch?v=-kjPIANqglU",
    ),
  ],
  "ezekiel": [
    OverviewVideoLink(
      title: "以西結書 上半 Ezekiel 1–33",
      url: "https://www.youtube.com/watch?v=hzr62tsmGuo",
    ),
    OverviewVideoLink(
      title: "以西結書 下半 Ezekiel 34–48",
      url: "https://www.youtube.com/watch?v=BMhL99CK8qU",
    ),
  ],
  "daniel": [
    OverviewVideoLink(
      title: "但以理書 Daniel",
      url: "https://www.youtube.com/watch?v=2j82eTGW__A",
    ),
  ],
  "hosea": [
    OverviewVideoLink(
      title: "何西阿書 Hosea",
      url: "https://www.youtube.com/watch?v=KEyPGQUDSrk",
    ),
  ],
  "joel": [
    OverviewVideoLink(
      title: "約珥書 Joel",
      url: "https://www.youtube.com/watch?v=vSLras6GMx0",
    ),
  ],
  "amos": [
    OverviewVideoLink(
      title: "阿摩司書 Amos",
      url: "https://www.youtube.com/watch?v=AwFItLAUmUM",
    ),
  ],
  "obadiah": [
    OverviewVideoLink(
      title: "俄巴底亞書 Obadiah",
      url: "https://www.youtube.com/watch?v=NUFxs_U5DSQ",
    ),
  ],
  "jonah": [
    OverviewVideoLink(
      title: "約拿書 Jonah",
      url: "https://www.youtube.com/watch?v=ghlyhkxsSSA",
    ),
  ],
  "micah": [
    OverviewVideoLink(
      title: "彌迦書 Micah",
      url: "https://www.youtube.com/watch?v=d25yFlobX9g",
    ),
  ],
  "nahum": [
    OverviewVideoLink(
      title: "那鴻書 Nahum",
      url: "https://www.youtube.com/watch?v=yObTVShFiVc",
    ),
  ],
  "habakkuk": [
    OverviewVideoLink(
      title: "哈巴谷書 Habakkuk",
      url: "https://www.youtube.com/watch?v=4jfLIxg9ad4",
    ),
  ],
  "zephaniah": [
    OverviewVideoLink(
      title: "西番雅書 Zephaniah",
      url: "https://www.youtube.com/watch?v=GaSMAFwP3pQ",
    ),
  ],
  "haggai": [
    OverviewVideoLink(
      title: "哈該書 Haggai",
      url: "https://www.youtube.com/watch?v=EVCM9iXV0xQ",
    ),
  ],
  "zechariah": [
    OverviewVideoLink(
      title: "撒迦利亞書 Zechariah",
      url: "https://www.youtube.com/watch?v=-xIol92Kasg",
    ),
  ],
  "malachi": [
    OverviewVideoLink(
      title: "瑪拉基書 Malachi",
      url: "https://www.youtube.com/watch?v=Wv2ypgfsuRQ",
    ),
  ],
};
