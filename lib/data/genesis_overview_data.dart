import "package:flutter/material.dart";

import "../models/book_overview.dart";

/// 創世記範例內容（可日後改為 JSON / 遠端載入）
const BookOverview genesisOverview = BookOverview(
  id: "genesis",
  shortName: "創",
  fullName: "創世記",
  category: "摩西五經",
  chapterCount: 50,
  keyTheme: "神創造天地，人類墮落，但神立即展開拯救與恢復的計劃。",
  keyVerses: [
    KeyVerse(
      reference: "創世記 1:1",
      cuv: "起初，神創造天地。",
      tncv: "太初，上帝創造了天地。",
    ),
    KeyVerse(
      reference: "創世記 3:15",
      cuv: "我又要叫你和女人彼此為仇……女人的後裔要傷你的頭。",
      tncv: "我要使你們彼此為仇……女人的後裔要傷你的頭。",
    ),
  ],
  backgroundIntro:
      "傳統認為摩西在曠野寫成，對象是剛出埃及、要在應許之地生活的以色列人。"
      "本書從「起初」說起，交代萬有與人類的起源，以及神如何揀選一個家族，"
      "延續祂對全地的祝福計劃。",
  whyImportant: "這是整本聖經的根基，幫助我們明白神從起初就有的計劃，"
      "以及為什麼今天仍需要救恩與恢復。",
  overviewVideos: [
    OverviewVideoLink(
      title: "創世記 上半：1–11 章",
      url: "https://www.youtube.com/watch?v=S38rIpQrVS8",
    ),
    OverviewVideoLink(
      title: "創世記 下半：12–50 章",
      url: "https://www.youtube.com/watch?v=nPq-GwxtXFY",
    ),
  ],
  keyFigures: [
    KeyFigure(
      name: "亞當、夏娃",
      oneLiner: "受造與墮落，顯出人需要神的恩典。",
      emoji: "🌿",
    ),
    KeyFigure(
      name: "亞伯拉罕",
      oneLiner: "因信稱義，承接應許之約。",
      emoji: "⭐",
    ),
    KeyFigure(
      name: "雅各",
      oneLiner: "在掙扎中被改名以色列，經歷神的管教與同在。",
      emoji: "🪜",
    ),
    KeyFigure(
      name: "約瑟",
      oneLiner: "被賣卻高升，保存家族與列國性命。",
      emoji: "🌾",
    ),
  ],
  outline: [
    OutlineSection(
      chapterRange: "第 1–11 章",
      title: "上古歷史",
      summary: "創造、墮落、洪水、巴別塔——說明萬有與人類的開端，以及罪如何進入世界。",
    ),
    OutlineSection(
      chapterRange: "第 12–50 章",
      title: "列祖歷史",
      summary: "從亞伯拉罕到約瑟，看見神的揀選、應許與信實，即使人軟弱，計劃仍向前。",
    ),
  ],
  storyHighlights: [
    StoryHighlight(
      title: "創造與安息",
      description: "七日創造，神看為好；人蒙召與神同工、享受安息。",
      chapterLabel: "創 1–2",
      chapter: 1,
    ),
    StoryHighlight(
      title: "墮落與首次福音",
      description: "人悖逆後，神仍宣告救贖將從「女人的後裔」而來。",
      chapterLabel: "創 3",
      chapter: 3,
    ),
    StoryHighlight(
      title: "亞伯拉罕之約",
      description: "因信蒙召離開本地，成為萬國祝福的管道。",
      chapterLabel: "創 12",
      chapter: 12,
    ),
    StoryHighlight(
      title: "約瑟與保全性命",
      description: "人的惡意被神轉為拯救，預表後來更大的救贖。",
      chapterLabel: "創 37–50",
      chapter: 37,
    ),
  ],
  christConnections: [
    ChristConnection(
      otLabel: "逾越節羊羔（預表）",
      ntFulfillment: "基督是神的羔羊，除去世人罪孽。",
      verseRef: "約 1:29",
    ),
    ChristConnection(
      otLabel: "亞伯拉罕的後裔、應許之子",
      ntFulfillment: "那應許之子指向基督，萬國因祂得福。",
      verseRef: "加 3:16",
    ),
    ChristConnection(
      otLabel: "女人的後裔傷蛇的頭",
      ntFulfillment: "十字架上得勝，敗壞那掌死權的。",
      verseRef: "來 2:14-15",
    ),
  ],
  applications: [
    "每天默想「神是創造主」：我的生活與身分都從祂而來。",
    "承認軟弱與罪性時，記得神早已預備救贖，不靠自己的義。",
    "學習像亞伯拉罕一樣，在不明朗中仍踏出信心的下一步。",
    "在困境中問：神是否正在「使萬事互相效力」？我可以如何信靠祂？",
  ],
  prayerPrompts: [
    "主啊，感謝祢從起初就有恢復的計劃，求祢幫助我今天仰望祢的應許。",
    "求祢光照我裡面需要認罪與交託的地方，讓我經歷祢的恩典。",
    "願我像亞伯拉罕一樣，願意回應祢的呼召，成為身邊人的祝福。",
  ],
  songLinks: [
    SongLink(
      title: "敬拜詩歌（範例連結）",
      url: "https://www.youtube.com/results?search_query=%E5%89%B5%E4%B8%96%E8%A8%98+%E8%A9%A9%E6%AD%8C",
    ),
  ],
  quiz: [
    QuizQuestion(
      question: "（創 1）開宗明義的第一句是？",
      choices: ["起初，神創造天地", "你要生養眾多", "我是自有永有的", "你要離開本地本族"],
      correctIndex: 0,
      feedback: "創 1:1 宣告神是創造主，為全書起筆。",
    ),
    QuizQuestion(
      question: "（創 3）神對蛇說女人的後裔要傷你的頭，常被稱為？",
      choices: ["大誡命", "首次福音（原始福音）", "十誡", "大使命"],
      correctIndex: 1,
      feedback: "創 3:15 在咒詛中已預告救贖。",
    ),
    QuizQuestion(
      question: "（創 12）亞伯拉罕蒙召時，神應許萬國如何因他得福？",
      choices: ["向他納貢", "因他與他的後裔得福", "都學他建方舟", "都受割禮"],
      correctIndex: 1,
      feedback: "創 12:1-3 應許萬國因亞伯拉罕得福。",
    ),
    QuizQuestion(
      question: "（創 37 起）約瑟被賣到埃及後，至創世記末神透過他成就什麼？",
      choices: ["建造聖殿", "保全許多人的性命", "頒布十誡", "寫詩篇"],
      correctIndex: 1,
      feedback: "創 45:5 等：神差他先去，為要保全生命。",
    ),
    QuizQuestion(
      question: "（全書結構）創世記兩大敘事段落如何劃分？",
      choices: ["律法與先知", "上古歷史（1–11）與列祖歷史（12–50）", "詩歌與智慧", "福音與書信"],
      correctIndex: 1,
      feedback: "前段創造至巴別，後段亞伯拉罕家族至下埃及。",
    ),
  ],
  heroGradient: [
    Color(0xFF0F4C5C),
    Color(0xFF1B7F7A),
    Color(0xFF52B788),
  ],
);
