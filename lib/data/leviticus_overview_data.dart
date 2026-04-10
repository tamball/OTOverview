import "package:flutter/material.dart";

import "../models/book_overview.dart";

const BookOverview leviticusOverview = BookOverview(
  id: "leviticus",
  shortName: "利",
  fullName: "利未記",
  category: "摩西五經",
  chapterCount: 27,
  keyTheme: "聖潔的神呼召祂的百姓在敬拜、生活與人際中活出聖潔。",
  keyVerses: [
    KeyVerse(reference: "利未記 19:2", cuv: "你們要聖潔，因為我耶和華你們的神是聖潔的。", tncv: "你們要聖潔，因為我耶和華你們的上帝是聖潔的。"),
  ],
  backgroundIntro: "利未記承接出埃及記會幕敬拜背景，教導祭司制度、獻祭條例與聖潔生活準則。",
  whyImportant: "初信者可從本書明白：與神親近需要贖罪恩典，也需要生命更新。",
  overviewVideos: [
    OverviewVideoLink(
      title: "利未記",
      url: "https://www.youtube.com/watch?v=8kKtZDYqf5c",
    ),
  ],
  keyFigures: [
    KeyFigure(name: "亞倫", oneLiner: "大祭司，代表百姓到神面前。", emoji: "🕯️"),
    KeyFigure(name: "利未人", oneLiner: "被分別出來服事神與百姓。", emoji: "📜"),
  ],
  outline: [
    OutlineSection(chapterRange: "1–10 章", title: "獻祭與祭司", summary: "五祭、祭司按立與敬拜秩序。"),
    OutlineSection(chapterRange: "11–22 章", title: "聖潔條例", summary: "潔淨與不潔淨、倫理與敬拜生活。"),
    OutlineSection(chapterRange: "23–27 章", title: "節期與奉獻", summary: "節期敬拜、許願與奉獻的回應。"),
  ],
  storyHighlights: [
    StoryHighlight(title: "贖罪日", description: "每年一次，為全體百姓贖罪。", chapterLabel: "利 16", chapter: 16),
  ],
  christConnections: [
    ChristConnection(otLabel: "祭牲與流血", ntFulfillment: "基督一次獻上自己，成全永遠救贖。", verseRef: "來 9:12"),
  ],
  applications: [
    "敬拜不只是儀式，也包含每天分別為聖的生活。",
    "靠著基督的恩典，學習遠離罪、活出聖潔。",
  ],
  prayerPrompts: [
    "主啊，求祢潔淨我，讓我在生活中榮耀祢。",
  ],
  songLinks: [
    SongLink(title: "敬拜詩歌（聖潔主題）", url: "https://www.youtube.com/results?search_query=%E8%81%96%E6%BD%94+%E8%A9%A9%E6%AD%8C"),
  ],
  quiz: [
    QuizQuestion(
      question: "（利 1–7）本書前半關於獻祭與祭司事奉，主要教導什麼？",
      choices: ["僅徵稅條例", "藉獻祭親近聖潔的神、處理罪與奉獻", "選立君王", "建耶路撒冷城牆"],
      correctIndex: 1,
      feedback: "五祭等條例指向敬拜與贖罪原則。",
    ),
    QuizQuestion(
      question: "（利 8–9）亞倫與其子承接祭司職分時，有何重要場面？",
      choices: ["過紅海", "按立禮與首次在會幕供職、火從耶和華面前出來", "建巴別塔", "立約書亞作王"],
      correctIndex: 1,
      feedback: "利 9:24：有火從耶和華面前出來，燒盡祭物。",
    ),
    QuizQuestion(
      question: "（利 16）一年中為全會眾贖罪最核心的一天是？",
      choices: ["逾越節", "贖罪日（亞倫進入至聖所）", "普珥節", "住棚節首日"],
      correctIndex: 1,
      feedback: "利 16 詳述贖罪日與公山羊禮儀。",
    ),
    QuizQuestion(
      question: "（利 17–22）神反覆呼召百姓要如何生活？",
      choices: ["富足尊貴", "聖潔，因耶和華是聖潔的", "征戰擴張", "隱居曠野"],
      correctIndex: 1,
      feedback: "如利 19:2：你們要聖潔，因為我耶和華你們的神是聖潔的。",
    ),
    QuizQuestion(
      question: "（利 23–27）書末較多論及什麼？",
      choices: ["列王征戰", "節期、禧年與許願奉獻等", "被擄回歸", "建造第一聖殿"],
      correctIndex: 1,
      feedback: "節期敬拜與地業、奉獻條例。",
    ),
  ],
  heroGradient: [Color(0xFF264653), Color(0xFF2A9D8F), Color(0xFFA8DADC)],
);
