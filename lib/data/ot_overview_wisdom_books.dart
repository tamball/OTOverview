import "package:flutter/material.dart";

import "../models/book_overview.dart";

BookOverview? wisdomOtBookOverview(String id) {
  switch (id) {
    case "job":
      return _job;
    case "psalms":
      return _psalms;
    case "proverbs":
      return _proverbs;
    case "ecclesiastes":
      return _ecclesiastes;
    case "song_of_songs":
      return _songOfSongs;
    default:
      return null;
  }
}

String _songQ(String name) =>
    "https://www.youtube.com/results?search_query=${Uri.encodeComponent("$name 聖經 詩歌")}";

final _gradW1 = [const Color(0xFF311B92), const Color(0xFF5E35B1), const Color(0xFFB39DDB)];
final _gradW2 = [const Color(0xFF004D40), const Color(0xFF00695C), const Color(0xFF4DB6AC)];

final _job = BookOverview(
  id: "job",
  shortName: "伯",
  fullName: "約伯記",
  category: "智慧文學",
  chapterCount: 42,
  keyTheme: "義人受苦之謎：在辯論與風暴中遇見超越辯論的神，學習謙卑與信靠。",
  keyVerses: const [
    KeyVerse(
      reference: "伯 1:21",
      cuv: "賞賜的是耶和華，收取的也是耶和華。耶和華的名是應當稱頌的。",
      tncv: "賞賜的是耶和華，收取的也是耶和華。耶和華的名是應當稱頌的。",
    ),
    KeyVerse(
      reference: "伯 42:5-6",
      cuv: "我從前風聞有你，現在親眼見你。因此我厭惡自己，在塵土和爐灰中懊悔。",
      tncv: "我從前只聽見有關你的事，現在卻親眼看見你。因此我厭惡自己，在塵土和爐灰中懊悔。",
    ),
  ],
  backgroundIntro: "約伯的完全與試炼、三友辯論、以利戶、耶和華在旋風中回應、約伯悔改與恢復。"
      "本書處理「苦難與神的公義」這古老卻仍切身的問題。",
  whyImportant: "當我們不明白苦難時，本書引導我們從「解釋神」轉向「敬拜神」。",
  keyFigures: const [
    KeyFigure(name: "約伯", oneLiner: "完全正直卻經歷極深試炼。", emoji: "🕯️"),
    KeyFigure(name: "約伯三友", oneLiner: "以因果論解釋苦難，卻不夠周全。", emoji: "💬"),
    KeyFigure(name: "以利戶", oneLiner: "年輕發言者，指出約伯自義可能。", emoji: "🗣️"),
  ],
  outline: const [
    OutlineSection(chapterRange: "1–2 章", title: "序言", summary: "天上議論與約伯家破人亡仍不棄絕神。"),
    OutlineSection(chapterRange: "3–31 章", title: "對話", summary: "約伯與三友反覆辯論義與苦難。"),
    OutlineSection(chapterRange: "32–37 章", title: "以利戶", summary: "指出神的威嚴與管教。"),
    OutlineSection(chapterRange: "38–42 章", title: "耶和華與結局", summary: "神從自然與受造發問、約伯悔改、加倍賜福。"),
  ],
  storyHighlights: const [
    StoryHighlight(title: "約伯初聞災禍", description: "撕裂外袍卻稱頌神名。", chapterLabel: "伯 1", chapter: 1),
    StoryHighlight(title: "旋風中的顯現", description: "神以受造界的奧秘回應人的渺小。", chapterLabel: "伯 38-41", chapter: 38),
  ],
  christConnections: const [
    ChristConnection(
      otLabel: "受苦的義人",
      ntFulfillment: "義者基督為罪人的苦難與代求成就救恩。",
      verseRef: "彼前 2:21-24",
    ),
  ],
  applications: const [
    "陪伴受苦者時，避免草率論斷「你一定有罪」。",
    "在不明白中仍選擇信靠，像約伯最終仰望神。",
  ],
  prayerPrompts: const [
    "主啊，我風聞有祢，求使我真認識祢的同在。",
  ],
  songLinks: [SongLink(title: "相關敬拜搜尋", url: _songQ("約伯記"))],
  quiz: const [
    QuizQuestion(
      question: "（伯 1–2）開場撒但試煉後，約伯如何回應家破人亡？",
      choices: ["咒詛神", "撕裂外袍仍稱頌「賞賜的是耶和華，收取的也是耶和華」", "自殺", "攻擊三友"],
      correctIndex: 1,
      feedback: "伯 1:20-22；2:10。",
    ),
    QuizQuestion(
      question: "（伯 3–31）約伯與三友長篇辯論主要環繞什麼主題？",
      choices: ["建殿尺寸", "苦難與神的公義／約伯是否因罪受苦", "逾越節日期", "家譜"],
      correctIndex: 1,
      feedback: "三友以因果論質疑，約伯自辯。",
    ),
    QuizQuestion(
      question: "（伯 32–37）在約伯與三友之後發言的年輕人是誰？",
      choices: ["以賽亞", "以利戶", "摩西", "但以理"],
      correctIndex: 1,
      feedback: "伯 32：以利戶怒三友與約伯。",
    ),
    QuizQuestion(
      question: "（伯 38–41）耶和華從何處向約伯說話，以受造界發問？",
      choices: ["聖殿至聖所", "旋風中", "夢裡", "火荊棘"],
      correctIndex: 1,
      feedback: "伯 38:1：旋風中顯現。",
    ),
    QuizQuestion(
      question: "（伯 42）結局約伯如何回應神，並有何結果？",
      choices: ["繼續咒詛", "厭惡自己在塵土爐灰中懊悔，神使他從擄掠轉回加倍賜福", "離開本族", "作王"],
      correctIndex: 1,
      feedback: "伯 42：悔改與恢復。",
    ),
  ],
  overviewVideos: const [],
  heroGradient: _gradW1,
);

final _psalms = BookOverview(
  id: "psalms",
  shortName: "詩",
  fullName: "詩篇",
  category: "智慧文學",
  chapterCount: 150,
  keyTheme: "神的子民以禱告、讚美、哀哭與信靠，在一切處境中向神敞開心。",
  keyVerses: const [
    KeyVerse(
      reference: "詩 23:1",
      cuv: "耶和華是我的牧者，我必不致缺乏。",
      tncv: "耶和華是我的牧者，我必一無所缺。",
    ),
    KeyVerse(
      reference: "詩 119:105",
      cuv: "你的話是我腳前的燈，是我路上的光。",
      tncv: "你的話是我腳前的燈，是我路上的光。",
    ),
  ],
  backgroundIntro: "以色列的詩歌禱告書，涵蓋讚美、認罪、咒詛詩、彌賽亞預言與錫安盼望。"
      "大衛與其他詩人把人生百態帶到神面前。",
  whyImportant: "教導我們用整全的情感敬拜，並在禱告中對齊神的性情與應許。",
  keyFigures: const [
    KeyFigure(name: "大衛", oneLiner: "多首詩篇與他生平相連。", emoji: "🎵"),
    KeyFigure(name: "可拉後裔亞薩等", oneLiner: "不同群體的敬拜傳統。", emoji: "🎶"),
  ],
  outline: const [
    OutlineSection(chapterRange: "1–41 卷一", title: "大衛詩集（之一）", summary: "禱告、讚美、咒詛詩與悔罪。"),
    OutlineSection(chapterRange: "42–72 卷二", title: "可拉後裔等", summary: "聖所渴望、王的詩篇。"),
    OutlineSection(chapterRange: "73–89 卷三", title: "亞薩等", summary: "苦難中的信心與神的公義。"),
    OutlineSection(chapterRange: "90–106 卷四", title: "摩西詩等", summary: "神的永恆與子民的歷史。"),
    OutlineSection(chapterRange: "107–150 卷五", title: "讚美上行", summary: "哈利路亞頌與錫安歌。"),
  ],
  storyHighlights: const [
    StoryHighlight(title: "主導我如羊", description: "牧者詩篇的安慰。", chapterLabel: "詩 23", chapter: 23),
    StoryHighlight(title: "寶貴的房角石", description: "被棄的石頭成為根基（預表基督）。", chapterLabel: "詩 118", chapter: 118),
  ],
  christConnections: const [
    ChristConnection(
      otLabel: "受難與復活的禱告",
      ntFulfillment: "耶穌與使徒引用詩篇論彌賽亞（如詩 22, 110）。",
      verseRef: "路 24:44",
    ),
  ],
  applications: const [
    "每天以一篇詩篇禱告，讓情感與真理對齊。",
  ],
  prayerPrompts: const [
    "主啊，求祢的話作我今日的燈與光。",
  ],
  songLinks: [SongLink(title: "相關敬拜搜尋", url: _songQ("詩篇"))],
  quiz: const [
    QuizQuestion(
      question: "（詩 1）卷一開篇如何對比兩種人？",
      choices: ["富與窮", "不從惡人計謀的義人如樹栽於水旁，惡人如糠秕被風吹散", "利未與猶大", "祭司與先知"],
      correctIndex: 1,
      feedback: "詩 1：兩條道路。",
    ),
    QuizQuestion(
      question: "（詩 23）大衛著名「牧者詩」起句是？",
      choices: ["耶和華是我的牧者", "諸天述說神的榮耀", "神啊，求你憐憫我", "哈利路亞"],
      correctIndex: 0,
      feedback: "詩 23:1。",
    ),
    QuizQuestion(
      question: "（詩 51）大衛認罪詩中向神求什麼？",
      choices: ["財富", "清潔的心、正直的靈，塗抹罪惡", "長壽無病", "打敗非利士"],
      correctIndex: 1,
      feedback: "詩 51：與拔示巴事件相關的悔改。",
    ),
    QuizQuestion(
      question: "（詩 119）最長篇如何形容神的話？",
      choices: ["腳前的燈、路上的光", "僅歷史故事", "飲食規條而已", "無關救恩"],
      correctIndex: 0,
      feedback: "詩 119:105。",
    ),
    QuizQuestion(
      question: "（詩 146–150）卷五結尾連續多篇有何共同開頭？",
      choices: ["哀哉", "你們要讚美耶和華（哈利路亞）", "虛空的虛空", "耶和華如此說"],
      correctIndex: 1,
      feedback: "哈利路亞頌系列。",
    ),
  ],
  overviewVideos: const [],
  heroGradient: _gradW2,
);

final _proverbs = BookOverview(
  id: "proverbs",
  shortName: "箴",
  fullName: "箴言",
  category: "智慧文學",
  chapterCount: 31,
  keyTheme: "敬畏耶和華是知識的開端：智慧、公義、言語與人際的生活操練。",
  keyVerses: const [
    KeyVerse(
      reference: "箴 1:7",
      cuv: "敬畏耶和華是知識的開端；愚妄人藐視智慧和訓誨。",
      tncv: "敬畏耶和華是知識的開端，愚妄人藐視智慧和訓誨。",
    ),
    KeyVerse(
      reference: "箴 3:5-6",
      cuv: "你要專心仰賴耶和華，不可倚靠自己的聰明……",
      tncv: "你要專心仰賴耶和華，不可倚靠自己的聰明……",
    ),
  ],
  backgroundIntro: "所羅門與其他智慧人的格言，教導青年與領袖如何在日常生活中活出敬畏神。"
      "本書不是救恩公式，而是聖靈引導下的生活智慧。",
  whyImportant: "塑造言語、金錢、性別界線與工作倫理，在世俗文化中活出分別。",
  keyFigures: const [
    KeyFigure(name: "所羅門", oneLiner: "箴言主要傳統作者。", emoji: "👑"),
    KeyFigure(name: "智慧擬人化", oneLiner: "呼召人選擇智慧勝過愚昧。", emoji: "✨"),
  ],
  outline: const [
    OutlineSection(chapterRange: "1–9 章", title: "智慧的呼召", summary: "敬畏神、遠離淫亂與愚昧的勸勉。"),
    OutlineSection(chapterRange: "10–24 章", title: "所羅門箴言集", summary: "對句格言，涵蓋生活各層面。"),
    OutlineSection(chapterRange: "25–29 章", title: "希西家的人所謄錄", summary: "更多所羅門箴言。"),
    OutlineSection(chapterRange: "30–31 章", title: "亞古珥與才德婦人", summary: "謙卑求告與家庭經營的智慧。"),
  ],
  storyHighlights: const [
    StoryHighlight(title: "智慧在街市呼喊", description: "智慧向人發出邀請。", chapterLabel: "箴 1", chapter: 1),
    StoryHighlight(title: "才德的婦人", description: "敬畏神的實踐在家庭中閃光。", chapterLabel: "箴 31", chapter: 31),
  ],
  christConnections: const [
    ChristConnection(
      otLabel: "智慧的本體",
      ntFulfillment: "基督是神的能力与智慧（林前 1:24）。",
      verseRef: "西 2:3",
    ),
  ],
  applications: const [
    "每天讀一章箴言（配合當月日期），默想一句應用。",
  ],
  prayerPrompts: const [
    "主啊，教我敬畏祢過於倚靠自己的聰明。",
  ],
  songLinks: [SongLink(title: "相關敬拜搜尋", url: _songQ("箴言"))],
  quiz: const [
    QuizQuestion(
      question: "（箴 1:7）本書開宗明義：知識的開端是？",
      choices: ["積累銀兩", "敬畏耶和華", "讀外邦哲學", "建造宮殿"],
      correctIndex: 1,
      feedback: "箴 1:7。",
    ),
    QuizQuestion(
      question: "（箴 1–9）前段多次出現智慧如何向人發出呼召？",
      choices: ["只在聖殿裡", "在街市、城門口等地公開呼喚人轉向智慧", "寫在石板不讀", "僅對祭司"],
      correctIndex: 1,
      feedback: "智慧彷彿在公共場所呼喊（箴 1、8 等）。",
    ),
    QuizQuestion(
      question: "（箴 10–24）書中段的格言主要文體是？",
      choices: ["敘事長篇", "希伯來對偶句（箴言式格言）", "異象錄", "家譜"],
      correctIndex: 1,
      feedback: "所羅門格言主體。",
    ),
    QuizQuestion(
      question: "（箴 25–29）這段序言稱與哪位猶大王的人謄錄有關？",
      choices: ["大衛", "希西家", "約西亞", "所羅門同時"],
      correctIndex: 1,
      feedback: "箴 25:1。",
    ),
    QuizQuestion(
      question: "（箴 31）全書末章著名段落描述誰？",
      choices: ["所羅門婚禮", "才德的婦人", "巴力先知", "非利士巨人"],
      correctIndex: 1,
      feedback: "箴 31:10-31。",
    ),
  ],
  overviewVideos: const [],
  heroGradient: _gradW1,
);

final _ecclesiastes = BookOverview(
  id: "ecclesiastes",
  shortName: "傳",
  fullName: "傳道書",
  category: "智慧文學",
  chapterCount: 12,
  keyTheme: "在日光之下的虛空與勞碌中，認定敬畏神、守祂誡命才是人的本分。",
  keyVerses: const [
    KeyVerse(
      reference: "傳 1:2",
      cuv: "虛空的虛空，虛空的虛空，凡事都是虛空。",
      tncv: "虛空的虛空，虛空的虛空，凡事都是虛空。",
    ),
    KeyVerse(
      reference: "傳 12:13",
      cuv: "總意就是：敬畏神，謹守他的誡命，這是人所當盡的本分。",
      tncv: "事情總結就是：敬畏上帝，謹守他的誡命，這是人所當盡的本分。",
    ),
  ],
  backgroundIntro: "傳道者（多數傳統認為與所羅門相關）以智慧實驗日光之下的一切，"
      "發現財富、享樂、名聲皆捕風，最後歸結於敬畏神。",
  whyImportant: "幫助我們誠實面對人生的限制，不把盼望寄託在必朽壞的事上。",
  keyFigures: const [
    KeyFigure(name: "傳道者", oneLiner: "以「虛空」為鑰匙反思人生。", emoji: "🌬️"),
  ],
  outline: const [
    OutlineSection(chapterRange: "1–2 章", title: "虛空與試驗", summary: "智慧、享樂、工程皆虛空。"),
    OutlineSection(chapterRange: "3–8 章", title: "時間與公義", summary: "凡事有定期、日光之下的不公義。"),
    OutlineSection(chapterRange: "9–12 章", title: "死亡與結論", summary: "少年當記念造物主、敬畏神守誡命。"),
  ],
  storyHighlights: const [
    StoryHighlight(title: "凡事都有定期", description: "生有时死有时，神掌管節奏。", chapterLabel: "傳 3", chapter: 3),
    StoryHighlight(title: "記念造物主", description: "在衰殘來到前先敬畏神。", chapterLabel: "傳 12", chapter: 12),
  ],
  christConnections: const [
    ChristConnection(
      otLabel: "日光之上的意義",
      ntFulfillment: "在基督裡承受不能朽壞的產業與復活的盼望。",
      verseRef: "彼前 1:3-4",
    ),
  ],
  applications: const [
    "省思自己把「意義感」建立在什麼之上；轉向永恆。",
  ],
  prayerPrompts: const [
    "主啊，在虛空中教我以敬畏祢為滿足。",
  ],
  songLinks: [SongLink(title: "相關敬拜搜尋", url: _songQ("傳道書"))],
  quiz: const [
    QuizQuestion(
      question: "（傳 1:2）傳道者開篇如何形容日光之下？",
      choices: ["盡都美好", "虛空的虛空，凡事都是虛空", "永恆不變", "僅有歡樂"],
      correctIndex: 1,
      feedback: "傳 1:2。",
    ),
    QuizQuestion(
      question: "（傳 1–2）傳道者以智慧、享樂、工程試驗後的結論是？",
      choices: ["日光之下皆捕風、無益", "財富最可靠", "名聲永存", "無需敬畏神"],
      correctIndex: 0,
      feedback: "傳 1:14、2:11 等。",
    ),
    QuizQuestion(
      question: "（傳 3）「生有時、死有時」強調什麼？",
      choices: ["隨己意行", "凡事有定期，神掌管節奏", "否定神", "廢除律法"],
      correctIndex: 1,
      feedback: "傳 3:1-8。",
    ),
    QuizQuestion(
      question: "（傳 9–12 前段）傳道者如何提醒面對死亡與年日？",
      choices: ["及時行樂不論道德", "當趁年幼記念造物主，因為衰殘日子必到", "禁止禱告", "只靠子孫"],
      correctIndex: 1,
      feedback: "傳 12:1：趁年幼記念造物主。",
    ),
    QuizQuestion(
      question: "（傳 12:13）全書總結人所當盡的本分是？",
      choices: ["積累財寶", "敬畏神，謹守祂的誡命", "追求名聲", "躲避人群"],
      correctIndex: 1,
      feedback: "傳 12:13。",
    ),
  ],
  overviewVideos: const [],
  heroGradient: _gradW2,
);

final _songOfSongs = BookOverview(
  id: "song_of_songs",
  shortName: "歌",
  fullName: "雅歌",
  category: "智慧文學",
  chapterCount: 8,
  keyTheme: "以愛的詩歌歌頌愛情中的忠誠與美好，歷代亦從中讀出神與子民／基督與教會的愛。",
  keyVerses: const [
    KeyVerse(
      reference: "歌 2:4",
      cuv: "他以愛為旗幟在我以上。",
      tncv: "他以愛為旗幟在我以上。",
    ),
    KeyVerse(
      reference: "歌 8:6",
      cuv: "因為愛情如死之堅強……所發的電光是耶和華的烈焰。",
      tncv: "因為愛情像死亡一樣堅強……所發出的光焰是耶和華的烈焰。",
    ),
  ],
  backgroundIntro: "男女之間的對唱情歌，充滿園林、香料與尋找的意象。"
      "猶太與基督教傳統常以寓意讀法指向神與以色列或基督與教會。",
  whyImportant: "在聖潔界線內肯定愛與身體的美好，並指向盟約之愛的忠誠。",
  keyFigures: const [
    KeyFigure(name: "良人與佳偶", oneLiner: "詩中愛情的兩位主角。", emoji: "💒"),
    KeyFigure(name: "耶路撒冷眾女子", oneLiner: "旁白與和聲。", emoji: "👭"),
  ],
  outline: const [
    OutlineSection(chapterRange: "1–3 章", title: "相慕與尋找", summary: "愛的吸引與分離的焦慮。"),
    OutlineSection(chapterRange: "4–5 章", title: "讚美與夢境", summary: "身體的讚美與門外錯過。"),
    OutlineSection(chapterRange: "6–8 章", title: "和好與堅固", summary: "愛如死亡堅強、不容奪去。"),
  ],
  storyHighlights: const [
    StoryHighlight(title: "不要驚動愛情", description: "等侯其時。", chapterLabel: "歌 2:7", chapter: 2),
    StoryHighlight(title: "我屬良人", description: "盟約歸屬的宣告。", chapterLabel: "歌 7:10", chapter: 7),
  ],
  christConnections: const [
    ChristConnection(
      otLabel: "盟約之愛",
      ntFulfillment: "丈夫愛妻子，正如基督愛教會（弗 5:25-32 引用奧秘）。",
      verseRef: "弗 5:32",
    ),
  ],
  applications: const [
    "在婚姻或單身中，學習尊重、等候與聖潔的愛。",
  ],
  prayerPrompts: const [
    "主啊，願我經歷與祢親密同行，也尊重人際界線。",
  ],
  songLinks: [SongLink(title: "相關敬拜搜尋", url: _songQ("雅歌"))],
  quiz: const [
    QuizQuestion(
      question: "（歌 1–2 前段）本書開頭呈現什麼文體與主題？",
      choices: ["律法條文", "良人與佳偶相慕的愛情詩歌對唱", "戰爭年表", "家譜"],
      correctIndex: 1,
      feedback: "歌 1:1 稱為所羅門的歌。",
    ),
    QuizQuestion(
      question: "（歌 2:7 等）佳偶囑咐耶路撒冷的眾女子什麼？",
      choices: ["立刻打仗", "不要驚動、不要叫醒愛情，等牠自己願意", "拆毀園子", "禁食四十天"],
      correctIndex: 1,
      feedback: "愛情須等候其时。",
    ),
    QuizQuestion(
      question: "（歌 4–5）詩中出現較多哪類內容？",
      choices: ["十誡重述", "對佳偶身體與美麗的讚美，以及尋找與開門的張力", "建殿尺寸", "列王名單"],
      correctIndex: 1,
      feedback: "讚美與夢境般的尋找。",
    ),
    QuizQuestion(
      question: "（歌 6–7）敘事中兩人關係基調如何發展？",
      choices: ["決裂無和好", "重新和好、親密讚美加深", "改嫁他人", "審判異象"],
      correctIndex: 1,
      feedback: "和好與歸屬「我屬良人」。",
    ),
    QuizQuestion(
      question: "（歌 8）如何形容愛情的堅固與排他？",
      choices: ["如浮雲易散", "如死之堅強，眾水不能熄滅", "無關盟約", "僅友情"],
      correctIndex: 1,
      feedback: "歌 8:6-7。",
    ),
  ],
  overviewVideos: const [],
  heroGradient: _gradW1,
);
