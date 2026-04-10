import "package:flutter/material.dart";

import "../models/book_overview.dart";

const BookOverview numbersOverview = BookOverview(
  id: "numbers",
  shortName: "民",
  fullName: "民數記",
  category: "摩西五經",
  chapterCount: 36,
  keyTheme: "神在曠野中帶領、管教並保守祂的百姓，呼召他們憑信心前行。",
  keyVerses: [
    KeyVerse(reference: "民數記 14:9", cuv: "你們不可背叛耶和華，也不要怕那地的居民。", tncv: "你們不可背叛耶和華，也不要怕那地的人民。"),
  ],
  backgroundIntro: "民數記記錄兩次人口調查與曠野旅程，展示不信與信靠的對比。",
  whyImportant: "幫助初信者理解：信心順服能帶來前進，不信抱怨會使人停滯。",
  overviewVideos: [
    OverviewVideoLink(
      title: "民數記",
      url: "https://www.youtube.com/watch?v=YDldRQUdmT4",
    ),
  ],
  keyFigures: [
    KeyFigure(name: "摩西", oneLiner: "忠心帶領百姓，為民代求。", emoji: "🏜️"),
    KeyFigure(name: "約書亞、迦勒", oneLiner: "在眾人恐懼中仍堅持信靠神。", emoji: "🛡️"),
  ],
  outline: [
    OutlineSection(chapterRange: "1–10 章", title: "整隊預備", summary: "點算百姓，安排支派與行軍秩序。"),
    OutlineSection(chapterRange: "11–25 章", title: "曠野失敗", summary: "抱怨、悖逆與不信，帶來管教。"),
    OutlineSection(chapterRange: "26–36 章", title: "新一代預備進地", summary: "重新數點、重申分地與秩序。"),
  ],
  storyHighlights: [
    StoryHighlight(title: "十二探子", description: "十人報惡信，兩人憑信心仰望神。", chapterLabel: "民 13–14", chapter: 13),
  ],
  christConnections: [
    ChristConnection(otLabel: "曠野舉銅蛇", ntFulfillment: "人子被舉起，叫信的人得生命。", verseRef: "約 3:14-15"),
  ],
  applications: [
    "遇見困難時，先回到神的應許，而非只看環境。",
    "在群體中學習停止抱怨，彼此建立信心。",
  ],
  prayerPrompts: [
    "主啊，求祢賜我信心，在曠野仍跟隨祢。",
  ],
  songLinks: [
    SongLink(title: "敬拜詩歌（信心主題）", url: "https://www.youtube.com/results?search_query=%E4%BF%A1%E5%BF%83+%E8%A9%A9%E6%AD%8C"),
  ],
  quiz: [
    QuizQuestion(
      question: "（民 1–4）本書開頭兩次主要行動是？",
      choices: ["立王與建殿", "數點會眾與利未人代替長子事奉", "過約旦河", "寫詩篇"],
      correctIndex: 1,
      feedback: "民 1-4：組織行軍與會幕事奉。",
    ),
    QuizQuestion(
      question: "（民 11–12）百姓在曠野多次抱怨，神曾賜下什麼食物養他們？",
      choices: ["嗎哪與鵪鶉", "嗎哪與無花果餅", "嗎哪與葡萄", "僅清水"],
      correctIndex: 0,
      feedback: "民 11：嗎哪與鵪鶉。",
    ),
    QuizQuestion(
      question: "（民 13–14）窺探迦南後，多數探子報惡信，誰與誰堅持可進應許之地？",
      choices: ["可拉、大坍", "約書亞、迦勒", "摩西、亞倫", "拿答、亞比戶"],
      correctIndex: 1,
      feedback: "民 14:6-9：約書亞與迦勒撕裂衣服勸百姓。",
    ),
    QuizQuestion(
      question: "（民 16）可拉一黨叛逆，主要針對什麼？",
      choices: ["不要過節期", "挑戰摩西亞倫的領袖與祭司權柄", "拒絕割禮", "要回埃及種田"],
      correctIndex: 1,
      feedback: "民 16：可拉與同黨向摩西亞倫爭權。",
    ),
    QuizQuestion(
      question: "（民 27–36）臨近摩西離世前，書末較多處理什麼？",
      choices: ["建造聖殿", "女兒承業、約書亞繼任與支派地業等", "立掃羅為王", "寫箴言"],
      correctIndex: 1,
      feedback: "西羅非哈女兒、摩西上手按約書亞、境界與許願條例等。",
    ),
  ],
  heroGradient: [Color(0xFF3A5A40), Color(0xFF588157), Color(0xFFA3B18A)],
);
