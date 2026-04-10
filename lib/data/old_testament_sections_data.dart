import "../models/book_overview.dart";
import "../models/ot_section.dart";

/// 首頁舊約分部（含《讀聖經》系列概覽影片連結）。
const List<OtSection> oldTestamentSections = [
  OtSection(
    id: "torah",
    title: "摩西五經",
    description: "律法書：創造、拯救之約、敬拜與聖潔、曠野旅程與重申律法。",
    overviewVideos: [
      OverviewVideoLink(
        title: "《讀聖經》舊約（TaNaK）導論",
        url: "https://www.youtube.com/watch?v=K8za2xnOes0",
      ),
      OverviewVideoLink(
        title: "創世記 上半（1–11 章）",
        url: "https://www.youtube.com/watch?v=S38rIpQrVS8",
      ),
      OverviewVideoLink(
        title: "創世記 下半（12–50 章）",
        url: "https://www.youtube.com/watch?v=nPq-GwxtXFY",
      ),
      OverviewVideoLink(
        title: "出埃及記 上半（1–18 章）",
        url: "https://www.youtube.com/watch?v=M7xmrTOVHso",
      ),
      OverviewVideoLink(
        title: "出埃及記 下半（19–40 章）",
        url: "https://www.youtube.com/watch?v=QVecD3mjHxM",
      ),
    ],
    books: [
      OtBookRef(id: "genesis", shortName: "創", fullName: "創世記", chapterCount: 50),
      OtBookRef(id: "exodus", shortName: "出", fullName: "出埃及記", chapterCount: 40),
      OtBookRef(id: "leviticus", shortName: "利", fullName: "利未記", chapterCount: 27),
      OtBookRef(id: "numbers", shortName: "民", fullName: "民數記", chapterCount: 36),
      OtBookRef(id: "deuteronomy", shortName: "申", fullName: "申命記", chapterCount: 34),
    ],
  ),
  OtSection(
    id: "history",
    title: "歷史書",
    description: "進入應許之地、王國興衰、被擴與歸回；見證神的信實與人的抉擇。",
    overviewVideos: [
      OverviewVideoLink(
        title: "約書亞記 Joshua",
        url: "https://www.youtube.com/watch?v=IFEK6lfc9nQ",
      ),
      OverviewVideoLink(
        title: "士師記 Judges",
        url: "https://www.youtube.com/watch?v=-lC-Z9AQ-GY",
      ),
      OverviewVideoLink(
        title: "路得記 Ruth",
        url: "https://www.youtube.com/watch?v=p38YoZ7THz0",
      ),
      OverviewVideoLink(
        title: "撒母耳記上 1 Samuel",
        url: "https://www.youtube.com/watch?v=nBJUtByLPpM",
      ),
      OverviewVideoLink(
        title: "撒母耳記下 2 Samuel",
        url: "https://www.youtube.com/watch?v=NjRHWF6HPUc",
      ),
      OverviewVideoLink(
        title: "列王紀上、下 1–2 Kings",
        url: "https://www.youtube.com/watch?v=O1JFu6KUYbI",
      ),
      OverviewVideoLink(
        title: "歷代志上、下 1–2 Chronicles",
        url: "https://www.youtube.com/watch?v=xm2JacZAohc",
      ),
      OverviewVideoLink(
        title: "以斯拉記+尼希米記 Ezra–Nehemiah",
        url: "https://www.youtube.com/watch?v=n4LViN8Yrzo",
      ),
      OverviewVideoLink(
        title: "以斯帖記 Esther",
        url: "https://www.youtube.com/watch?v=rNOdRXgRnbw",
      ),
    ],
    books: [
      OtBookRef(id: "joshua", shortName: "書", fullName: "約書亞記", chapterCount: 24),
      OtBookRef(id: "judges", shortName: "士", fullName: "士師記", chapterCount: 21),
      OtBookRef(id: "ruth", shortName: "得", fullName: "路得記", chapterCount: 4),
      OtBookRef(id: "1_samuel", shortName: "撒上", fullName: "撒母耳記上", chapterCount: 31),
      OtBookRef(id: "2_samuel", shortName: "撒下", fullName: "撒母耳記下", chapterCount: 24),
      OtBookRef(id: "1_kings", shortName: "王上", fullName: "列王紀上", chapterCount: 22),
      OtBookRef(id: "2_kings", shortName: "王下", fullName: "列王紀下", chapterCount: 25),
      OtBookRef(id: "1_chronicles", shortName: "代上", fullName: "歷代志上", chapterCount: 29),
      OtBookRef(id: "2_chronicles", shortName: "代下", fullName: "歷代志下", chapterCount: 36),
      OtBookRef(id: "ezra", shortName: "拉", fullName: "以斯拉記", chapterCount: 10),
      OtBookRef(id: "nehemiah", shortName: "尼", fullName: "尼希米記", chapterCount: 13),
      OtBookRef(id: "esther", shortName: "斯", fullName: "以斯帖記", chapterCount: 10),
    ],
  ),
  OtSection(
    id: "wisdom",
    title: "智慧文學",
    description: "詩歌與智慧傳統：苦難與敬拜、箴言式生活、虛空與愛的頌歌。",
    overviewVideos: [
      OverviewVideoLink(
        title: "約伯記 Job",
        url: "https://www.youtube.com/watch?v=1riXgorBEtY",
      ),
      OverviewVideoLink(
        title: "詩篇 Psalms",
        url: "https://www.youtube.com/watch?v=kzgtXbeandI",
      ),
      OverviewVideoLink(
        title: "箴言 Proverbs",
        url: "https://www.youtube.com/watch?v=njXJoKxkBvU",
      ),
      OverviewVideoLink(
        title: "傳道書 Ecclesiastes",
        url: "https://www.youtube.com/watch?v=goIq3Zc8Az8",
      ),
      OverviewVideoLink(
        title: "雅歌 Song of Songs",
        url: "https://www.youtube.com/watch?v=En8_2w6ZOkE",
      ),
    ],
    books: [
      OtBookRef(id: "job", shortName: "伯", fullName: "約伯記", chapterCount: 42),
      OtBookRef(id: "psalms", shortName: "詩", fullName: "詩篇", chapterCount: 150),
      OtBookRef(id: "proverbs", shortName: "箴", fullName: "箴言", chapterCount: 31),
      OtBookRef(id: "ecclesiastes", shortName: "傳", fullName: "傳道書", chapterCount: 12),
      OtBookRef(id: "song_of_songs", shortName: "歌", fullName: "雅歌", chapterCount: 8),
    ],
  ),
  OtSection(
    id: "prophets",
    title: "先知書",
    description: "大、小先知呼召百姓悔改、預告審判與恢復，指向神的公義與最終拯救。",
    overviewVideos: [
      OverviewVideoLink(
        title: "以賽亞書 上半 Isaiah 1–39",
        url: "https://www.youtube.com/watch?v=w2ePRvVZ51g",
      ),
      OverviewVideoLink(
        title: "以賽亞書 下半 Isaiah 40–66",
        url: "https://www.youtube.com/watch?v=444uVC_xt4g",
      ),
      OverviewVideoLink(
        title: "耶利米書 Jeremiah",
        url: "https://www.youtube.com/watch?v=y5iHS9jb99E",
      ),
      OverviewVideoLink(
        title: "耶利米哀歌 Lamentations",
        url: "https://www.youtube.com/watch?v=-kjPIANqglU",
      ),
      OverviewVideoLink(
        title: "以西結書 上半 Ezekiel 1–33",
        url: "https://www.youtube.com/watch?v=hzr62tsmGuo",
      ),
      OverviewVideoLink(
        title: "以西結書 下半 Ezekiel 34–48",
        url: "https://www.youtube.com/watch?v=BMhL99CK8qU",
      ),
      OverviewVideoLink(
        title: "但以理書 Daniel",
        url: "https://www.youtube.com/watch?v=2j82eTGW__A",
      ),
      OverviewVideoLink(
        title: "何西阿書 Hosea",
        url: "https://www.youtube.com/watch?v=KEyPGQUDSrk",
      ),
      OverviewVideoLink(
        title: "約珥書 Joel",
        url: "https://www.youtube.com/watch?v=vSLras6GMx0",
      ),
      OverviewVideoLink(
        title: "阿摩司書 Amos",
        url: "https://www.youtube.com/watch?v=AwFItLAUmUM",
      ),
      OverviewVideoLink(
        title: "俄巴底亞書 Obadiah",
        url: "https://www.youtube.com/watch?v=NUFxs_U5DSQ",
      ),
      OverviewVideoLink(
        title: "約拿書 Jonah",
        url: "https://www.youtube.com/watch?v=ghlyhkxsSSA",
      ),
      OverviewVideoLink(
        title: "彌迦書 Micah",
        url: "https://www.youtube.com/watch?v=d25yFlobX9g",
      ),
      OverviewVideoLink(
        title: "那鴻書 Nahum",
        url: "https://www.youtube.com/watch?v=yObTVShFiVc",
      ),
      OverviewVideoLink(
        title: "哈巴谷書 Habakkuk",
        url: "https://www.youtube.com/watch?v=4jfLIxg9ad4",
      ),
      OverviewVideoLink(
        title: "西番雅書 Zephaniah",
        url: "https://www.youtube.com/watch?v=GaSMAFwP3pQ",
      ),
      OverviewVideoLink(
        title: "哈該書 Haggai",
        url: "https://www.youtube.com/watch?v=EVCM9iXV0xQ",
      ),
      OverviewVideoLink(
        title: "撒迦利亞書 Zechariah",
        url: "https://www.youtube.com/watch?v=-xIol92Kasg",
      ),
      OverviewVideoLink(
        title: "瑪拉基書 Malachi",
        url: "https://www.youtube.com/watch?v=Wv2ypgfsuRQ",
      ),
    ],
    books: [
      OtBookRef(id: "isaiah", shortName: "賽", fullName: "以賽亞書", chapterCount: 66),
      OtBookRef(id: "jeremiah", shortName: "耶", fullName: "耶利米書", chapterCount: 52),
      OtBookRef(id: "lamentations", shortName: "哀", fullName: "耶利米哀歌", chapterCount: 5),
      OtBookRef(id: "ezekiel", shortName: "結", fullName: "以西結書", chapterCount: 48),
      OtBookRef(id: "daniel", shortName: "但", fullName: "但以理書", chapterCount: 12),
      OtBookRef(id: "hosea", shortName: "何", fullName: "何西阿書", chapterCount: 14),
      OtBookRef(id: "joel", shortName: "珥", fullName: "約珥書", chapterCount: 3),
      OtBookRef(id: "amos", shortName: "摩", fullName: "阿摩司書", chapterCount: 9),
      OtBookRef(id: "obadiah", shortName: "俄", fullName: "俄巴底亞書", chapterCount: 1),
      OtBookRef(id: "jonah", shortName: "拿", fullName: "約拿書", chapterCount: 4),
      OtBookRef(id: "micah", shortName: "彌", fullName: "彌迦書", chapterCount: 7),
      OtBookRef(id: "nahum", shortName: "鴻", fullName: "那鴻書", chapterCount: 3),
      OtBookRef(id: "habakkuk", shortName: "哈", fullName: "哈巴谷書", chapterCount: 3),
      OtBookRef(id: "zephaniah", shortName: "番", fullName: "西番雅書", chapterCount: 3),
      OtBookRef(id: "haggai", shortName: "該", fullName: "哈該書", chapterCount: 2),
      OtBookRef(id: "zechariah", shortName: "亞", fullName: "撒迦利亞書", chapterCount: 14),
      OtBookRef(id: "malachi", shortName: "瑪", fullName: "瑪拉基書", chapterCount: 4),
    ],
  ),
];

/// 首頁置頂：整部舊約導論影片。
const List<OverviewVideoLink> oldTestamentIntroVideos = [
  OverviewVideoLink(
    title: "《讀聖經》舊約（TaNaK）導論",
    url: "https://www.youtube.com/watch?v=K8za2xnOes0",
  ),
];
