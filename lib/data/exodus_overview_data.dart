import "package:flutter/material.dart";

import "../models/book_overview.dart";

/// 出埃及記範例內容（可日後改為 JSON / 遠端載入）
const BookOverview exodusOverview = BookOverview(
  id: "exodus",
  shortName: "出",
  fullName: "出埃及記",
  category: "摩西五經",
  chapterCount: 40,
  keyTheme: "神拯救祂的百姓脫離奴役，與他們立約，帶領他們學習敬拜與聖潔生活。",
  keyVerses: [
    KeyVerse(
      reference: "出埃及記 3:14",
      cuv: "神對摩西說：我是自有永有的。",
      tncv: "上帝對摩西說：我是那自有永有者。",
    ),
    KeyVerse(
      reference: "出埃及記 12:13",
      cuv: "我一見這血，就越過你們去。",
      tncv: "我看見這血，就越過你們。",
    ),
  ],
  backgroundIntro:
      "傳統認為摩西寫作，記錄以色列人在埃及為奴、被神大能拯救，"
      "並在西奈山領受律法與會幕藍圖。"
      "這卷書幫助初信者認識：救恩不只是脫離捆綁，也包含與神建立關係。",
  whyImportant: "出埃及記讓我們看見神聽見受苦者呼求，且以恩典與真理塑造祂的子民。",
  overviewVideos: [
    OverviewVideoLink(
      title: "出埃及記 上半：1–18 章",
      url: "https://www.youtube.com/watch?v=M7xmrTOVHso",
    ),
    OverviewVideoLink(
      title: "出埃及記 下半：19–40 章",
      url: "https://www.youtube.com/watch?v=QVecD3mjHxM",
    ),
  ],
  keyFigures: [
    KeyFigure(name: "摩西", oneLiner: "蒙召帶領百姓離開埃及，作神的僕人。", emoji: "🔥"),
    KeyFigure(name: "亞倫", oneLiner: "摩西的同工，在百姓前傳達神的信息。", emoji: "🕊️"),
    KeyFigure(name: "法老", oneLiner: "心剛硬抗拒神，成為審判與救贖背景。", emoji: "👑"),
    KeyFigure(name: "以色列民", oneLiner: "從奴隸到立約子民，學習信靠與順服。", emoji: "🏕️"),
  ],
  outline: [
    OutlineSection(
      chapterRange: "第 1–18 章",
      title: "拯救與出離",
      summary: "神透過十災與逾越節審判埃及、釋放百姓，並在紅海顯明祂的大能。",
    ),
    OutlineSection(
      chapterRange: "第 19–24 章",
      title: "西奈之約",
      summary: "神與百姓立約，頒布十誡與律例，呼召他們成為聖潔國度。",
    ),
    OutlineSection(
      chapterRange: "第 25–40 章",
      title: "會幕與同在",
      summary: "神啟示會幕敬拜，百姓經歷失敗與恢復，最後神榮光充滿會幕。",
    ),
  ],
  storyHighlights: [
    StoryHighlight(
      title: "荊棘火焰中的呼召",
      description: "摩西在曠野蒙神呼召，神啟示祂是自有永有者。",
      chapterLabel: "出 3",
      chapter: 3,
    ),
    StoryHighlight(
      title: "逾越節之夜",
      description: "羔羊的血成為記號，預表神的拯救與遮蓋。",
      chapterLabel: "出 12",
      chapter: 12,
    ),
    StoryHighlight(
      title: "紅海得救",
      description: "神為百姓開路，也使追兵覆沒，顯明祂是拯救者。",
      chapterLabel: "出 14",
      chapter: 14,
    ),
    StoryHighlight(
      title: "十誡與立約",
      description: "被救贖的百姓學習如何在生活中回應神。",
      chapterLabel: "出 20",
      chapter: 20,
    ),
  ],
  christConnections: [
    ChristConnection(
      otLabel: "逾越節羊羔",
      ntFulfillment: "基督是為我們被殺的逾越節羔羊。",
      verseRef: "林前 5:7",
    ),
    ChristConnection(
      otLabel: "嗎哪與活命糧",
      ntFulfillment: "耶穌是從天降下真正的生命糧。",
      verseRef: "約 6:32-35",
    ),
    ChristConnection(
      otLabel: "會幕中的神同在",
      ntFulfillment: "道成肉身住在我們中間，成就更完全的同在。",
      verseRef: "約 1:14",
    ),
  ],
  applications: [
    "記得神也看見我的重擔，並且願意引導我走出捆綁。",
    "得救之後，不是放縱自己，而是學習用生活敬拜神。",
    "遇到前有紅海、後有追兵時，先安靜等候神的作為。",
    "每天在小事上順服，培養與神立約子民相稱的生命。",
  ],
  prayerPrompts: [
    "主啊，求祢拯救我脫離一切捆綁，教我專一跟隨祢。",
    "求祢使我在家庭、工作、教會中活出聖潔與愛。",
    "願祢的同在成為我每天最深的安全感與盼望。",
  ],
  songLinks: [
    SongLink(
      title: "敬拜詩歌（出埃及記主題）",
      url: "https://www.youtube.com/results?search_query=%E5%87%BA%E5%9F%83%E5%8F%8A%E8%A8%98+%E8%A9%A9%E6%AD%8C",
    ),
  ],
  quiz: [
    QuizQuestion(
      question: "（出 3）神在何處向摩西顯現並差他救百姓離開埃及？",
      choices: ["西奈山頂", "荊棘火焰中", "紅海邊", "會幕門口"],
      correctIndex: 1,
      feedback: "出 3：我是自有永有的，去見法老。",
    ),
    QuizQuestion(
      question: "（出 12）逾越節門楣上塗羊血表示什麼？",
      choices: ["財富記號", "審判越過、長子蒙保守", "戰勝非利士", "獻殿落成"],
      correctIndex: 1,
      feedback: "出 12:13：我一見這血，就越過你們去。",
    ),
    QuizQuestion(
      question: "（出 14）以色列過紅海時，神如何使海水分開？",
      choices: ["地震自動裂開", "摩西舉杖、大東風使海退去", "法老下令", "約書亞吹角"],
      correctIndex: 1,
      feedback: "出 14:21-22：摩西向海伸杖，神用大東風。",
    ),
    QuizQuestion(
      question: "（出 20）西奈山下頒布的核心條文是？",
      choices: ["建殿條例", "十誡", "祭司薪俸", "禧年律例"],
      correctIndex: 1,
      feedback: "出 20：十誡為立約生活的根基。",
    ),
    QuizQuestion(
      question: "（出 40）會幕照藍圖建成後，有何明顯記號？",
      choices: ["天降嗎哪停止", "耶和華的榮光充滿會幕", "約櫃被擄", "金牛犢顯現"],
      correctIndex: 1,
      feedback: "出 40:34-35：雲彩與榮光顯示神與百姓同住。",
    ),
  ],
  heroGradient: [
    Color(0xFF1D3557),
    Color(0xFF457B9D),
    Color(0xFF2A9D8F),
  ],
);
