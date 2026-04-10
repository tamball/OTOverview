import "package:flutter/material.dart";

import "../models/book_overview.dart";

const BookOverview deuteronomyOverview = BookOverview(
  id: "deuteronomy",
  shortName: "申",
  fullName: "申命記",
  category: "摩西五經",
  chapterCount: 34,
  keyTheme: "在進入應許之地前，神重申祂的話，呼召百姓盡心愛主、忠心遵行。",
  keyVerses: [
    KeyVerse(reference: "申命記 6:5", cuv: "你要盡心、盡性、盡力愛耶和華你的神。", tncv: "你要全心、全性、全力愛耶和華你的上帝。"),
  ],
  backgroundIntro: "申命記是摩西在約旦河東的告別講論，回顧曠野並重申律法，預備新一代。",
  whyImportant: "讓初信者看見：屬靈生命需要常常回到神的話，並在日常生活中實踐。",
  overviewVideos: [
    OverviewVideoLink(
      title: "申命記",
      url: "https://www.youtube.com/watch?v=yHAem7XnxP4",
    ),
  ],
  keyFigures: [
    KeyFigure(name: "摩西", oneLiner: "臨終前重申神的話，牧養新一代。", emoji: "⛰️"),
    KeyFigure(name: "約書亞", oneLiner: "被委任承接帶領使命。", emoji: "🧭"),
  ],
  outline: [
    OutlineSection(chapterRange: "1–4 章", title: "回顧歷史", summary: "回看曠野歷程，提醒神的信實。"),
    OutlineSection(chapterRange: "5–26 章", title: "重申律法", summary: "十誡與生活條例，教導愛神愛人。"),
    OutlineSection(chapterRange: "27–34 章", title: "立約更新", summary: "祝福與咒詛、摩西祝福、交棒與離世。"),
  ],
  storyHighlights: [
    StoryHighlight(title: "示瑪（聽啊，以色列）", description: "呼召百姓盡心愛主並殷勤教導下一代。", chapterLabel: "申 6", chapter: 6),
  ],
  christConnections: [
    ChristConnection(otLabel: "神要興起像摩西的先知", ntFulfillment: "耶穌是那位應許中的先知與救主。", verseRef: "徒 3:22-23"),
  ],
  applications: [
    "建立每日讀經節奏，把神的話放在心上。",
    "在家庭與團契中主動分享神的作為，傳承信仰。",
  ],
  prayerPrompts: [
    "主啊，讓我今天就盡心愛祢，並順服祢的話。",
  ],
  songLinks: [
    SongLink(title: "敬拜詩歌（愛主主題）", url: "https://www.youtube.com/results?search_query=%E6%84%9B%E4%B8%BB+%E8%A9%A9%E6%AD%8C"),
  ],
  quiz: [
    QuizQuestion(
      question: "（申 1–4）摩西在約旦河東首要回顧什麼？",
      choices: ["建殿細則", "曠野旅程與神的引導、勸百姓遵行律例", "列王年代", "被擄歸回"],
      correctIndex: 1,
      feedback: "申 1-4：從西奈到巴蘭曠野的歷史與教訓。",
    ),
    QuizQuestion(
      question: "（申 5）摩西在何處重申十誡？",
      choices: ["埃及", "約旦河東摩押平原", "巴比倫", "波斯王宮"],
      correctIndex: 1,
      feedback: "申 1:5 等：在摩押地講解律法；申 5 重申十誡。",
    ),
    QuizQuestion(
      question: "（申 6）「示瑪」核心經文呼召人如何愛神？",
      choices: ["盡心、盡性、盡力愛耶和華你的神", "積累銀兩", "只守安息日", "禁止婚姻"],
      correctIndex: 0,
      feedback: "申 6:5：盡心、盡性、盡力愛主。",
    ),
    QuizQuestion(
      question: "（申 12–26）這大段主要內容性質是？",
      choices: ["家譜", "生活與敬拜的具體律例（中央敬拜、公義、節期等）", "哀歌", "預言列國"],
      correctIndex: 1,
      feedback: "又稱「申命法典」主體，應用在西奈律法之下。",
    ),
    QuizQuestion(
      question: "（申 27–34）書末摩西臨終前較突出的是？",
      choices: ["過紅海", "祝福與咒詛、摩西之歌、為約書亞按手與摩西離世", "建第一聖殿", "立大衛為王"],
      correctIndex: 1,
      feedback: "申 27-30 祝福咒詛之約，申 34 摩西死在尼波山。",
    ),
  ],
  heroGradient: [Color(0xFF283618), Color(0xFF606C38), Color(0xFFDDA15E)],
);
