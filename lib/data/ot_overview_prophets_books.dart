import "package:flutter/material.dart";

import "../models/book_overview.dart";

BookOverview? prophetsOtBookOverview(String id) {
  switch (id) {
    case "isaiah":
      return _isaiah;
    case "jeremiah":
      return _jeremiah;
    case "lamentations":
      return _lamentations;
    case "ezekiel":
      return _ezekiel;
    case "daniel":
      return _daniel;
    case "hosea":
      return _hosea;
    case "joel":
      return _joel;
    case "amos":
      return _amos;
    case "obadiah":
      return _obadiah;
    case "jonah":
      return _jonah;
    case "micah":
      return _micah;
    case "nahum":
      return _nahum;
    case "habakkuk":
      return _habakkuk;
    case "zephaniah":
      return _zephaniah;
    case "haggai":
      return _haggai;
    case "zechariah":
      return _zechariah;
    case "malachi":
      return _malachi;
    default:
      return null;
  }
}

String _songQ(String name) =>
    "https://www.youtube.com/results?search_query=${Uri.encodeComponent("$name 聖經 詩歌")}";

final _p1 = [const Color(0xFFBF360C), const Color(0xFFE64A19), const Color(0xFFFFAB91)];
final _p2 = [const Color(0xFF1A237E), const Color(0xFF303F9F), const Color(0xFF9FA8DA)];

final _isaiah = BookOverview(
  id: "isaiah",
  shortName: "賽",
  fullName: "以賽亞書",
  category: "先知書",
  chapterCount: 66,
  keyTheme: "責備、審判與安慰交織：聖潔的神、受苦的僕人與新創造、新耶路撒冷的盼望。",
  keyVerses: const [
    KeyVerse(
      reference: "賽 6:3",
      cuv: "聖哉！聖哉！聖哉！萬軍之耶和華；他的榮光充滿全地。",
      tncv: "聖哉！聖哉！聖哉！萬軍之耶和華；他的榮光充滿全地。",
    ),
    KeyVerse(
      reference: "賽 53:5",
      cuv: "哪知他為我們的過犯受害，為我們的罪孽壓傷。因他受的刑罰，我們得平安。",
      tncv: "哪知他為我們的過犯受害，為我們的罪孽壓傷。因他受的刑罰，我們得平安。",
    ),
  ],
  backgroundIntro: "前 39 章多對猶大與列國宣告審判與救贖；後 27 章在被擄語境中宣告安慰、僕人之歌與榮耀歸回。"
      "以賽亞在烏西雅至希西家年間事奉。",
  whyImportant: "新約大量引用本書指向彌賽亞與萬邦救恩。",
  keyFigures: const [
    KeyFigure(name: "以賽亞", oneLiner: "在聖殿見異象蒙召的先知。", emoji: "🔥"),
    KeyFigure(name: "神的僕人", oneLiner: "僕人之歌預表受苦與高舉。", emoji: "🕊️"),
  ],
  outline: const [
    OutlineSection(chapterRange: "1–39", title: "審判與餘民", summary: "聖潔呼召、亞述威脅、列國神諭。"),
    OutlineSection(chapterRange: "40–55", title: "安慰與僕人", summary: "「你們的神說」、受苦僕人、新出埃及。"),
    OutlineSection(chapterRange: "56–66", title: "新天新地", summary: "萬民敬拜、新耶路撒冷、最終榮耀。"),
  ],
  storyHighlights: const [
    StoryHighlight(title: "以賽亞見異象", description: "嘴唇沾炭蒙赦免。", chapterLabel: "賽 6", chapter: 6),
    StoryHighlight(title: "童女懷孕生子", description: "以馬內利的記號。", chapterLabel: "賽 7", chapter: 7),
    StoryHighlight(
      title: "第 40 章：福音",
      description: "「安慰、安慰我的百姓」—曠野有人聲喊著修直主的路；宣告神的榮耀必顯明，並對照人的短暫如草與神的話永立，預備人心迎向救恩佳音。",
      chapterLabel: "賽 40",
      chapter: 40,
    ),
  ],
  christConnections: const [
    ChristConnection(otLabel: "處女懷孕與以馬內利", ntFulfillment: "道成肉身住在我們中間。", verseRef: "太 1:23"),
    ChristConnection(otLabel: "受苦僕人", ntFulfillment: "耶穌受死復活應驗賽 53。", verseRef: "徒 8:32-35"),
  ],
  applications: const ["讀賽 53 默想代罪之愛。", "在審判信息中不忘神的安慰應許。"],
  prayerPrompts: const ["主啊，在祢的聖潔前使我謙卑，在祢的應許中使我剛強。"],
  songLinks: [SongLink(title: "相關敬拜搜尋", url: _songQ("以賽亞書"))],
  quiz: const [
    QuizQuestion(question: "（賽 6）以賽亞在聖殿異象中見主坐在寶座上時，有何反應與潔淨？", choices: ["立刻建殿", "禍哉、嘴唇沾炭蒙赦罪", "逃跑埃及", "立王"], correctIndex: 1, feedback: "賽 6:5-7。"),
    QuizQuestion(question: "（賽 7）神給亞哈斯家的「以馬內利」記號與何人有關？", choices: ["僅指希西家", "童女懷孕生子", "非利士王", "法老女兒"], correctIndex: 1, feedback: "賽 7:14。"),
    QuizQuestion(question: "（賽 36–39）亞述圍困耶路撒冷時，希西家如何得拯救？", choices: ["向埃及買兵", "禱告仰望耶和華，神擊殺亞述軍", "投降", "約書亞出擊"], correctIndex: 1, feedback: "賽 37。"),
    QuizQuestion(question: "（賽 40）被擄語境中「安慰、安慰」之後，主要信息是？", choices: ["放棄信仰", "曠野修直耶和華的路、神的話永立", "攻打羅馬", "廢除律法"], correctIndex: 1, feedback: "賽 40:3-8。"),
    QuizQuestion(question: "（賽 52–53）受苦僕人為誰受傷、使誰得平安？", choices: ["僅為外邦王", "為我們的過犯受害，使我們得平安", "為牲畜", "無人"], correctIndex: 1, feedback: "賽 53:5。"),
  ],
  overviewVideos: const [],
  heroGradient: _p1,
);

final _jeremiah = BookOverview(
  id: "jeremiah",
  shortName: "耶",
  fullName: "耶利米書",
  category: "先知書",
  chapterCount: 52,
  keyTheme: "落淚的先知宣告猶大滅亡與被擄，同時應許新約與歸回。",
  keyVerses: const [
    KeyVerse(reference: "耶 1:5", cuv: "我未將你造在腹中，我已曉得你……", tncv: "我尚未將你造在腹中，我已認識你……"),
    KeyVerse(reference: "耶 31:33", cuv: "我要將我的律法放在他們裡面，寫在他們心上。", tncv: "我要把我的律法放在他們裡面，寫在他們的心上。"),
  ],
  backgroundIntro: "約西亞至西底家年間，耶利米傳講悔改、聖殿與假平安的警戒，經歷逼迫、監禁與國破。"
      "本書充滿淚水，卻有新約與恢復的盼望。",
  whyImportant: "學習在國家與個人失序中仍忠心傳講神的話。",
  keyFigures: const [
    KeyFigure(name: "耶利米", oneLiner: "幼年蒙召、終身孤獨服事的先知。", emoji: "😢"),
    KeyFigure(name: "巴錄", oneLiner: "書記錄耶利米的信息。", emoji: "📝"),
  ],
  outline: const [
    OutlineSection(chapterRange: "1–25", title: "警戒與比喻", summary: "呼召、毀壞與建立的異象、對列國。"),
    OutlineSection(chapterRange: "26–45", title: "逼迫與被擄前夕", summary: "聖殿講道、監禁、耶路撒冷陷落。"),
    OutlineSection(chapterRange: "46–52", title: "列國與附錄", summary: "列邦神諭、耶路撒冷淪陷補述。"),
  ],
  storyHighlights: const [
    StoryHighlight(title: "瓦瓶的比喻", description: "神要打碎驕傲的器皿。", chapterLabel: "耶 19", chapter: 19),
    StoryHighlight(title: "買亞拿突的田", description: "被擄中仍買地象徵將來歸回。", chapterLabel: "耶 32", chapter: 32),
  ],
  christConnections: const [
    ChristConnection(otLabel: "新約", ntFulfillment: "基督的血成就律寫在心裡的應許。", verseRef: "來 8:8-12"),
  ],
  applications: const ["為教會與城市代求，像耶利米一樣不逃避壞消息。"],
  prayerPrompts: const ["主啊，求祢把祢的話像火放在我骨中。"],
  songLinks: [SongLink(title: "相關敬拜搜尋", url: _songQ("耶利米書"))],
  quiz: const [
    QuizQuestion(question: "（耶 1）耶利米蒙召時，神如何論到他年日？", choices: ["太年幼不可說話", "我未將你造在腹中我已曉得你，差遣你作列國的先知", "只做祭司", "立刻作王"], correctIndex: 1, feedback: "耶 1:5。"),
    QuizQuestion(question: "（耶 7–8）耶利米在聖殿門口責備百姓什麼心態？", choices: ["熱心獨一敬拜", "說「這是耶和華的殿」卻行不公與拜偶像的假平安", "遵守安息日過度", "拒絕獻祭"], correctIndex: 1, feedback: "耶 7:4-11。"),
    QuizQuestion(question: "（耶 19–20）耶利米打碎瓦瓶、被巴施戶珥打後，如何表達內心掙扎？", choices: ["否認呼召", "稱神的話如關閉在我骨中的火，卻不能不說", "離開猶大", "投降巴比倫"], correctIndex: 1, feedback: "耶 20:9。"),
    QuizQuestion(question: "（耶 31）神應許「新約」時，律法要放在哪裡？", choices: ["僅石版上", "他們裡面、寫在心上", "埃及石碑", "外邦廟中"], correctIndex: 1, feedback: "耶 31:33。"),
    QuizQuestion(question: "（耶 38–39）城破前後，耶利米經歷什麼？（依序理解）", choices: ["被立王", "被扔淤泥井、後耶路撒冷陷落", "去巴比倫作宰相", "寫詩篇150篇"], correctIndex: 1, feedback: "耶 38-39。"),
  ],
  overviewVideos: const [],
  heroGradient: _p2,
);

final _lamentations = BookOverview(
  id: "lamentations",
  shortName: "哀",
  fullName: "耶利米哀歌",
  category: "先知書",
  chapterCount: 5,
  keyTheme: "為耶路撒冷淪陷哀哭，卻在痛苦中承認罪惡並抓住「你的慈愛永遠長存」。",
  keyVerses: const [
    KeyVerse(reference: "哀 3:22-23", cuv: "我们不致消灭，是出于耶和华诸般的慈爱；是因他的怜悯不至断绝。每早晨，这都是新的。", tncv: "耶和華的慈愛永不断绝；他的怜悯永不断绝；每早晨都是新的。"),
  ],
  backgroundIntro: "五首哀歌體詩，前四首為離合詩結構，為聖城與聖殿被毀痛哭，卻在哀 3 轉向神的信實。",
  whyImportant: "教導群体與個人在災難中誠實哀哭，並仰望神的憐憫。",
  keyFigures: const [KeyFigure(name: "詩人（傳統耶利米）", oneLiner: "見證城破與神的憤怒與慈愛。", emoji: "🏙️")],
  outline: const [
    OutlineSection(chapterRange: "1–2 章", title: "荒涼與神的怒氣", summary: "錫安成寡婦、神的審判臨到。"),
    OutlineSection(chapterRange: "3 章", title: "個人與盼望", summary: "受苦與每早晨新的慈愛。"),
    OutlineSection(chapterRange: "4–5 章", title: "對比與禱告", summary: "昔日榮耀與今日羞辱、求神轉回。"),
  ],
  storyHighlights: const [StoryHighlight(title: "你的慈愛每早晨都是新的", description: "在黑暗中仍宣告神的信實。", chapterLabel: "哀 3", chapter: 3)],
  christConnections: const [ChristConnection(otLabel: "為耶路撒冷哀哭", ntFulfillment: "主為耶路撒冷嘆息（路 19:41）。", verseRef: "路 19:41-44")],
  applications: const ["允許自己與他人在苦難中哀哭，不強加空洞口號。"],
  prayerPrompts: const ["主啊，你的慈愛每早晨都是新的，求祢記念我。"],
  songLinks: [SongLink(title: "相關敬拜搜尋", url: _songQ("耶利米哀歌"))],
  quiz: const [
    QuizQuestion(question: "（哀 1）錫安處境如何被描寫？", choices: ["繁榮昌盛", "如寡婦、侍女中的貴婦淪為奴僕", "無人哭泣", "立刻復興"], correctIndex: 1, feedback: "哀 1:1。"),
    QuizQuestion(question: "（哀 2）為何聖殿與城牆被毀？", choices: ["無人犯罪", "耶和華發怒，如吞滅雅各的火焰", "地震自然災害", "波斯攻打"], correctIndex: 1, feedback: "哀 2:1-3。"),
    QuizQuestion(question: "（哀 3）在極深痛苦中，詩人因何仍有盼望？", choices: ["靠勢力", "耶和華的慈愛永不止息，每早晨都是新的", "忘記神", "投靠埃及"], correctIndex: 1, feedback: "哀 3:22-23。"),
    QuizQuestion(question: "（哀 4）昔日貴冑與今日對比如何？", choices: ["更加尊貴", "精金變為瓦器，聖民價值反轉", "無對比", "全民富足"], correctIndex: 1, feedback: "哀 4:1-2。"),
    QuizQuestion(question: "（哀 5）最後向神有何呼求？", choices: ["咒詛神", "求祢使我們回轉，便得復新；除非祢全然棄絕", "攻打列國", "立偶像"], correctIndex: 1, feedback: "哀 5:21-22。"),
  ],
  overviewVideos: const [],
  heroGradient: _p1,
);

final _ezekiel = BookOverview(
  id: "ezekiel",
  shortName: "結",
  fullName: "以西結書",
  category: "先知書",
  chapterCount: 48,
  keyTheme: "被擄中的先知見異象：神的榮耀離去與歸回、心靈更新與新聖殿新地的盼望。",
  keyVerses: const [
    KeyVerse(reference: "結 36:26", cuv: "我也要賜給你們一個新心，將新靈放在你們裡面……", tncv: "我要賜給你們一個新的心，將新的靈放在你們裡面……"),
    KeyVerse(reference: "結 37:27", cuv: "我的居所必在他們中間；我要作他们的神，他们要作我的子民。", tncv: "我的居所必在他們中間；我要作他們的上帝，他們要作我的子民。"),
  ],
  backgroundIntro: "祭司以西結在巴比倫被擄第五年見四活物與寶座異象，傳講耶路撒冷將受審判、榮耀離開聖殿，"
      "又預言枯骨復活、新心新靈與末世聖殿異象。",
  whyImportant: "認識神的榮耀與聖名，並盼望聖靈更新與神同住。",
  keyFigures: const [KeyFigure(name: "以西結", oneLiner: "被擄中的守望者與異象先知。", emoji: "🌀")],
  outline: const [
    OutlineSection(chapterRange: "1–24", title: "審判與榮耀離去", summary: "異象、象徵行動、聖殿敗壞。"),
    OutlineSection(chapterRange: "25–32", title: "列國審判", summary: "對周邊邦國的神諭。"),
    OutlineSection(chapterRange: "33–48", title: "守望、復興與新聖殿", summary: "個人責任、枯骨、新心、聖殿異象與地的分定。"),
  ],
  storyHighlights: const [
    StoryHighlight(title: "枯骨谷", description: "氣息進入，軍隊復活。", chapterLabel: "結 37", chapter: 37),
    StoryHighlight(title: "榮耀歸回聖殿", description: "神的名在列國中顯為聖。", chapterLabel: "結 43", chapter: 43),
  ],
  christConnections: const [ChristConnection(otLabel: "好牧人與神同在", ntFulfillment: "基督是好牧人，聖靈內住。", verseRef: "約 10:11; 約 14:16")],
  applications: const ["思想「個人靈魂的責任」（結 33）在今日如何應用。"],
  prayerPrompts: const ["主啊，求祢賜我新心新靈，使我遵行祢的律例。"],
  songLinks: [SongLink(title: "相關敬拜搜尋", url: _songQ("以西結書"))],
  quiz: const [
    QuizQuestion(question: "（結 1–3）以西結在巴比倫迦巴魯河邊首先見什麼？", choices: ["金牛犢", "四活物與寶座上的榮耀形像", "紅海分開", "約櫃"], correctIndex: 1, feedback: "結 1。"),
    QuizQuestion(question: "（結 8–11）耶和華的榮耀為何離開耶路撒冷聖殿？", choices: ["百姓敬拜虔誠", "殿中充滿可憎偶像與罪惡，榮耀東去", "大衛拆毀", "非利士奪走"], correctIndex: 1, feedback: "結 8-11。"),
    QuizQuestion(question: "（結 37）枯骨谷異象中，神使枯骨復活象徵？", choices: ["農業豐收", "以色列全家在絕望中蒙神復興", "建巴別塔", "立外邦王"], correctIndex: 1, feedback: "結 37:11-14。"),
    QuizQuestion(question: "（結 36:26）神應許賜什麼使百姓能遵行律例？", choices: ["更多金銀", "新心與新靈", "刀劍", "外邦神像"], correctIndex: 1, feedback: "結 36:26。"),
    QuizQuestion(question: "（結 40–48）書末詳述什麼異象？", choices: ["洪水", "末世聖殿、敬拜秩序與地業分定", "過紅海", "十災"], correctIndex: 1, feedback: "結 40-48。"),
  ],
  overviewVideos: const [],
  heroGradient: _p2,
);

final _daniel = BookOverview(
  id: "daniel",
  shortName: "但",
  fullName: "但以理書",
  category: "先知書",
  chapterCount: 12,
  keyTheme: "在被擄宮廷中持守信仰、解夢與異象顯明神掌管歷史直到末時。",
  keyVerses: const [
    KeyVerse(reference: "但 3:17-18", cuv: "即或不然，王啊，你當知道我們决不事奉你的神……", tncv: "即或不然，王啊，你應當知道：我們決不事奉你的神明……"),
    KeyVerse(reference: "但 7:13-14", cuv: "見有一位像人子的……得了权柄、荣耀、国度。", tncv: "我在夜間的異象中觀看，見有一位像人子的……得了權柄、榮耀、國度。"),
  ],
  backgroundIntro: "但以理與三友拒拜偶像、但以理解夢、末後異象與米迦勒興起，"
      "交織敘事與啟示文學，強調至高者在人的國中掌權。",
  whyImportant: "在文化壓力下學習「即或不然」的忠心，並仰望人子得國。",
  keyFigures: const [
    KeyFigure(name: "但以理", oneLiner: "智慧解夢、禱告不輟。", emoji: "📿"),
    KeyFigure(name: "沙得拉等三友", oneLiner: "寧願火窯也不拜金像。", emoji: "🔥"),
  ],
  outline: const [
    OutlineSection(chapterRange: "1–6", title: "宮廷敘事", summary: "拒俗、解夢、火窯、認罪禱告、獅子坑。"),
    OutlineSection(chapterRange: "7–12", title: "異象與末時", summary: "四獸、公綿羊山羊、七十个七。"),
  ],
  storyHighlights: const [
    StoryHighlight(title: "獅子坑中的禱告", description: "一日三次向耶路撒冷禱告。", chapterLabel: "但 6", chapter: 6),
    StoryHighlight(title: "像人子的得國", description: "永遠的國度與權柄。", chapterLabel: "但 7", chapter: 7),
  ],
  christConnections: const [ChristConnection(otLabel: "人子得國", ntFulfillment: "耶穌自稱人子，承受萬有。", verseRef: "太 26:64")],
  applications: const ["在職場與校園中辨識「拜像」試探，選擇小群體彼此堅固。"],
  prayerPrompts: const ["主啊，使我像但以理堅定禱告，仰望祢掌管歷史。"],
  songLinks: [SongLink(title: "相關敬拜搜尋", url: _songQ("但以理書"))],
  quiz: const [
    QuizQuestion(question: "（但 1）但以理與三友在飲食上如何分別？", choices: ["大吃大喝", "拒吃王膳、吃素菜喝水以免玷污", "只吃祭肉", "禁食不飲"], correctIndex: 1, feedback: "但 1:8-16。"),
    QuizQuestion(question: "（但 2）尼布甲尼撒的大像之夢，最後打碎全像的是？", choices: ["金頭自己倒下", "從山而出、非人手鑿出來的石頭", "波斯軍", "但以理的刀"], correctIndex: 1, feedback: "但 2:34-35。"),
    QuizQuestion(question: "（但 3）沙得拉等面對火窯時說「即或不然」是指？", choices: ["必定不會被扔", "神能拯救；即或不然，也决不拜王的金像", "投降", "否認神"], correctIndex: 1, feedback: "但 3:17-18。"),
    QuizQuestion(question: "（但 6）但以理被扔獅子坑的直接原因是？", choices: ["偷竊", "一日三次向神禱告違反禁令", "謀反", "拒絕作官"], correctIndex: 1, feedback: "但 6:10-13。"),
    QuizQuestion(question: "（但 7）異象中「像人子」的從何而來，得什麼？", choices: ["地裡上來得糧食", "駕天雲而來，得權柄、榮耀、國度", "海中得魚", "無得著"], correctIndex: 1, feedback: "但 7:13-14。"),
  ],
  overviewVideos: const [],
  heroGradient: _p1,
);

final _hosea = BookOverview(
  id: "hosea",
  shortName: "何",
  fullName: "何西阿書",
  category: "先知書",
  chapterCount: 14,
  keyTheme: "先知娶不貞之妻作象徵：以色列屬靈淫亂，神仍以慈繩愛索挽回。",
  keyVerses: const [KeyVerse(reference: "何 6:6", cuv: "我喜爱良善，不喜爱祭祀；喜爱认识神，胜于燔祭。", tncv: "我喜愛慈愛，不喜歡祭祀；喜愛人認識上帝，勝於人獻燔祭。")],
  backgroundIntro: "何西阿與歌篾的婚姻比喻背約與更新，責備拜巴力、政治結盟，並應許歸回與立約之愛。",
  whyImportant: "認識神忌邪的愛與對盟約的不捨。",
  keyFigures: const [KeyFigure(name: "何西阿", oneLiner: "以婚姻活出神的痛心與挽回。", emoji: "💔"), KeyFigure(name: "歌篾", oneLiner: "象徵以色列的不忠與蒙贖。", emoji: "🕊️")],
  outline: const [
    OutlineSection(chapterRange: "1–3", title: "婚姻象徵", summary: "娶歌篾、買回妻子。"),
    OutlineSection(chapterRange: "4–14", title: "責備與盼望", summary: "無知、審判、歸回大衛日、醫治與復興。"),
  ],
  storyHighlights: const [StoryHighlight(title: "我去歸回前夫", description: "神對背道子民的審判與呼召。", chapterLabel: "何 2", chapter: 2)],
  christConnections: const [ChristConnection(otLabel: "神招那不蒙愛的為愛妻", ntFulfillment: "教會蒙愛本是不配。", verseRef: "羅 9:25-26")],
  applications: const ["反省是否把別的「戀人」（錢財、名聲）放在神之前。"],
  prayerPrompts: const ["主啊，祢以慈繩愛索拉住我，求我回轉。"],
  songLinks: [SongLink(title: "相關敬拜搜尋", url: _songQ("何西阿書"))],
  quiz: const [
    QuizQuestion(question: "（何 1）神吩咐何西阿娶何種女子？其子名有何象徵？", choices: ["公主", "歌篾象徵以色列屬靈淫亂，子名預表審判與不蒙憐恤", "寡婦即可", "外邦女王"], correctIndex: 1, feedback: "何 1:2-9。"),
    QuizQuestion(question: "（何 2–3）神如何對待背道的「妻子」？只放棄嗎？", choices: ["永遠棄絕", "審判後仍以慈繩愛索挽回，甚至買回", "無作為", "只靠人手"], correctIndex: 1, feedback: "何 2:14-23；何 3 買回。"),
    QuizQuestion(question: "（何 4–5）北國宗教與道德主要問題？", choices: ["過度禁食", "無知、無誠實、無良善、拜巴力與淫亂", "太愛律法", "無戰爭"], correctIndex: 1, feedback: "何 4:1-3。"),
    QuizQuestion(question: "（何 6:6）神說喜悅什麼勝於燔祭？", choices: ["銀兩", "慈愛（或譯：良善）與認識神", "戰爭勝利", "宮殿"], correctIndex: 1, feedback: "何 6:6；太 9:13 引用。"),
    QuizQuestion(question: "（何 14）書末呼召以色列如何向神？", choices: ["投靠亞述", "歸向耶和華認罪，神要醫治他們的背道", "建巴力廟", "殺先知"], correctIndex: 1, feedback: "何 14:1-4。"),
  ],
  overviewVideos: const [],
  heroGradient: _p2,
);

final _joel = BookOverview(
  id: "joel",
  shortName: "珥",
  fullName: "約珥書",
  category: "先知書",
  chapterCount: 3,
  keyTheme: "蝗災與耶和華的日子：呼召禁食悔改，聖靈澆灌與萬民審判。",
  keyVerses: const [KeyVerse(reference: "珥 2:28", cuv: "以后，我要将我的灵浇灌凡有血气的。你们的儿女要说预言……", tncv: "以後，我要將我的靈澆灌所有的人。你們的兒女要說預言……")],
  backgroundIntro: "蝗蟲之災如審判預告，呼召錫民撕裂心腸、歸向神；應許聖靈澆灌與末後拯救。",
  whyImportant: "連結悔改、聖靈工作與五旬節應驗（徒 2）。",
  keyFigures: const [KeyFigure(name: "約珥", oneLiner: "向猶大傳悔改與耶和華日子。", emoji: "🦗")],
  outline: const [
    OutlineSection(chapterRange: "1 章", title: "災禍", summary: "蝗災毀壞，祭司哀哭。"),
    OutlineSection(chapterRange: "2 章", title: "悔改與拯救", summary: "耶和華的日子、吹角、蝗軍異象、神轉悔。"),
    OutlineSection(chapterRange: "3 章", title: "審判列國", summary: "約沙法谷、聖靈澆灌、萬民最終審判。"),
  ],
  storyHighlights: const [StoryHighlight(title: "聖靈澆灌", description: "僕人和使女也受感說預言。", chapterLabel: "珥 2:28-29", chapter: 2)],
  christConnections: const [ChristConnection(otLabel: "聖靈澆灌凡有血氣的", ntFulfillment: "五旬節彼得引用約珥書。", verseRef: "徒 2:16-21")],
  applications: const ["以禁食禱告回應个人與群体的危機。"],
  prayerPrompts: const ["主啊，撕裂我的心而非僅外衣，使我真實悔改。"],
  songLinks: [SongLink(title: "相關敬拜搜尋", url: _songQ("約珥書"))],
  quiz: const [
    QuizQuestion(question: "（珥 1）蝗災臨到時，先知呼召誰哀哭？", choices: ["僅外邦", "老年人、祭司與民，因糧食斷絕", "孩童遊戲", "無人"], correctIndex: 1, feedback: "珥 1:2-4、13。"),
    QuizQuestion(question: "（珥 2:1–17）「耶和華的日子」將到，百姓當如何？", choices: ["宴樂", "禁食、撕裂心腸、歸向神", "攻打埃及", "獻金牛犢"], correctIndex: 1, feedback: "珥 2:12-13。"),
    QuizQuestion(question: "（珥 2:18–27）神轉悔後應許什麼？", choices: ["繼續飢荒", "再賜糧食、補還年日、知道耶和華在中間", "滅絕百姓", "無雨"], correctIndex: 1, feedback: "珥 2:25-27。"),
    QuizQuestion(question: "（珥 2:28–32）神應許將靈澆灌在誰身上？", choices: ["僅祭司", "僕人、使女、兒女等凡有血氣的", "僅君王", "無人"], correctIndex: 1, feedback: "珥 2:28-29；徒 2 引用。"),
    QuizQuestion(question: "（珥 3）末後約沙法谷與列國審判的主題？", choices: ["僅農業", "神要審判列國、耶和華居錫安", "廢除聖殿", "無末世"], correctIndex: 1, feedback: "珥 3:1-2、16-17。"),
  ],
  overviewVideos: const [],
  heroGradient: _p1,
);

final _amos = BookOverview(
  id: "amos",
  shortName: "摩",
  fullName: "阿摩司書",
  category: "先知書",
  chapterCount: 9,
  keyTheme: "南國牧人向北國宣告：公義如大水氾濫，不可徒有節期卻欺壓窮人。",
  keyVerses: const [KeyVerse(reference: "摩 5:24", cuv: "惟愿公平如大水滚滚，使公义如江河滔滔。", tncv: "惟願公平如大水滾滾，使公義如江河滔滔！")],
  backgroundIntro: "阿摩司在烏西雅、約阿施年間向以色列傳講社會公義、真實敬拜與「耶和華的日子」的警告。",
  whyImportant: "信仰必須關心公義與弱勢，非僅宗教儀式。",
  keyFigures: const [KeyFigure(name: "阿摩司", oneLiner: "提哥亞牧人蒙差向北國發言。", emoji: "🐑")],
  outline: const [
    OutlineSection(chapterRange: "1–2", title: "八國宣判", summary: "三番四次犯罪的列國與猶大、以色列。"),
    OutlineSection(chapterRange: "3–6", title: "責備與呼籲", summary: "選民特權與責任、公平如大水。"),
    OutlineSection(chapterRange: "7–9", title: "異象與結局", summary: "準繩、夏天果子、重建大衛帳幕。"),
  ],
  storyHighlights: const [StoryHighlight(title: "拿貝的無花果", description: "先求饒再宣告審判的張力。", chapterLabel: "摩 7", chapter: 7)],
  christConnections: const [ChristConnection(otLabel: "公平公義", ntFulfillment: "主喜愛憐恤與公義（太 23:23）。", verseRef: "雅 1:27")],
  applications: const ["檢視生活與消費是否建立在對弱者的剝削上。"],
  prayerPrompts: const ["主啊，教我行公義、好憐憫，與祢同行。"],
  songLinks: [SongLink(title: "相關敬拜搜尋", url: _songQ("阿摩司書"))],
  quiz: const [
    QuizQuestion(question: "（摩 1–2）開篇對八國與猶大、以色列宣判「三番四次犯罪」，重點？", choices: ["無標準", "列國與選民都因殘暴、背約等受審", "僅誇獎", "僅埃及"], correctIndex: 1, feedback: "摩 1:3-2:8。"),
    QuizQuestion(question: "（摩 6）北國奢華與欺壓窮人，先知如何形容？", choices: ["無問題", "躺臥象牙床上、喝碗中濾清的酒，卻不顧約瑟的苦難", "全民貧窮", "無戰爭"], correctIndex: 1, feedback: "摩 6:4-6。"),
    QuizQuestion(question: "（摩 5）神厭惡哪種「節期」心態？", choices: ["真誠敬拜", "徒有敬拜儀式卻不行公義", "禁食", "獻十分之一"], correctIndex: 1, feedback: "摩 5:21-24。"),
    QuizQuestion(question: "（摩 7）拿貝的無花果異象中，阿摩司為何求情？", choices: ["喜歡蝗蟲", "怕雅各微弱不能站立，神就止息審判", "無原因", "懼怕法老"], correctIndex: 1, feedback: "摩 7:2-6。"),
    QuizQuestion(question: "（摩 9:11–15）書末應許包括？", choices: ["永遠荒廢", "重建大衛倒塌的帳幕、修造城邑、栽種葡萄", "滅絕以色列", "無盼望"], correctIndex: 1, feedback: "摩 9:11-14。"),
  ],
  overviewVideos: const [],
  heroGradient: _p2,
);

final _obadiah = BookOverview(
  id: "obadiah",
  shortName: "俄",
  fullName: "俄巴底亞書",
  category: "先知書",
  chapterCount: 1,
  keyTheme: "斥責以掃後裔以東在兄弟遭難時搶劫、幸災樂禍，預告報應與耶和華國度掌權。",
  keyVerses: const [KeyVerse(reference: "俄 1:15", cuv: "耶和华降罚的日子临近万国。你怎样行，人也必照样向你行。", tncv: "耶和華降罰的日子臨近萬國。你怎樣行，人也必照样向你行。")],
  backgroundIntro: "全書一章，針對以東在耶路撒冷被攻時的暴行，宣告山區的驕傲必被拉下。",
  whyImportant: "警戒對受苦弟兄幸災樂禍與趁火打劫。",
  keyFigures: const [KeyFigure(name: "俄巴底亞", oneLiner: "名意「耶和華的僕人」。", emoji: "⛰️")],
  outline: const [OutlineSection(chapterRange: "1 章", title: "以東受罰與雅各家得地", summary: "驕傲、搶掠、報應與王權歸耶和華。")],
  storyHighlights: const [StoryHighlight(title: "弟兄遭難不可袖手", description: "以東對雅各的態度受審。", chapterLabel: "俄 1", chapter: 1)],
  christConnections: const [ChristConnection(otLabel: "萬國受審", ntFulfillment: "萬民聚集審判（太 25）。", verseRef: "太 25:31-46")],
  applications: const ["在教会與社會衝突中，拒絕落井下石。"],
  prayerPrompts: const ["主啊，教我與哀哭的人同哭。"],
  songLinks: [SongLink(title: "相關敬拜搜尋", url: _songQ("俄巴底亞書"))],
  quiz: const [
    QuizQuestion(question: "（俄 1:1–9）以東因何受審？（依本書敘事順序）", choices: ["幫助兄弟", "驕傲居山穴、兄弟遭難時搶掠、幸災樂禍", "敬拜耶和華過度", "無罪"], correctIndex: 1, feedback: "俄 1:3-14。"),
    QuizQuestion(question: "（俄 1:10–14）耶路撒冷被滅時以東做了什麼？", choices: ["送糧救濟", "剪除逃脫的、擄掠財物", "禁食禱告", "無作為"], correctIndex: 1, feedback: "俄 1:11-14。"),
    QuizQuestion(question: "（俄 1:15–16）「你怎樣行，人也必怎樣向你行」指？", choices: ["無報應", "報應的日子臨到以東所行的歸己身", "獎賞以東", "無關萬國"], correctIndex: 1, feedback: "俄 1:15。"),
    QuizQuestion(question: "（俄 1:17–20）雅各家與以東結局對比？", choices: ["以東得聖山、雅各家滅亡", "雅各家必得產業、以東之地被擄者歸回", "無分別", "兩國合一拜巴力"], correctIndex: 1, feedback: "俄 1:17-20。"),
    QuizQuestion(question: "（俄 1:21）全書高潮？", choices: ["無王", "國度就歸耶和華了", "建金字塔", "以東永遠統治"], correctIndex: 1, feedback: "俄 1:21。"),
  ],
  overviewVideos: const [],
  heroGradient: _p1,
);

final _jonah = BookOverview(
  id: "jonah",
  shortName: "拿",
  fullName: "約拿書",
  category: "先知書",
  chapterCount: 4,
  keyTheme: "逃命的先知與悔改的外邦城：神的憐憫超乎種族，救恩臨到尼尼微。",
  keyVerses: const [KeyVerse(reference: "拿 2:9", cuv: "救恩出于耶和华。", tncv: "救恩出於耶和華。")],
  backgroundIntro: "約拿抗拒往尼尼微傳道，經大魚、蓖麻與炎日，學習神顧惜萬人與牲畜。",
  whyImportant: "打破狹隘的救恩觀，呼應萬民蒙福的計劃。",
  keyFigures: const [KeyFigure(name: "約拿", oneLiner: "向自己的種族偏見掙扎的先知。", emoji: "🐋"), KeyFigure(name: "尼尼微人", oneLiner: "從王到牲畜披麻禁食。", emoji: "🏙️")],
  outline: const [
    OutlineSection(chapterRange: "1 章", title: "逃避", summary: "下他施、風浪、拋海、大魚。"),
    OutlineSection(chapterRange: "2 章", title: "禱告", summary: "魚腹中認罪感恩。"),
    OutlineSection(chapterRange: "3 章", title: "悔改", summary: "傳講、尼尼微悔改。"),
    OutlineSection(chapterRange: "4 章", title: "神的問話", summary: "約拿發怒與蓖麻的功課。"),
  ],
  storyHighlights: const [StoryHighlight(title: "大魚三日三夜", description: "耶穌以此預表埋葬與復活。", chapterLabel: "拿 1-2", chapter: 1)],
  christConnections: const [ChristConnection(otLabel: "約拿的記號", ntFulfillment: "人子三日三夜在地裡（太 12:40）。", verseRef: "太 12:38-41")],
  applications: const ["願意為「不配得的人」傳福音與施憐憫。"],
  prayerPrompts: const ["主啊，赦免我像約拿一樣計較誰配得憐憫。"],
  songLinks: [SongLink(title: "相關敬拜搜尋", url: _songQ("約拿書"))],
  quiz: const [
    QuizQuestion(question: "（拿 1）約拿為何下他施、海上風浪大作？", choices: ["做生意", "躲避往尼尼微傳道的呼召", "捕魚", "朝聖"], correctIndex: 1, feedback: "拿 1:3、10。"),
    QuizQuestion(question: "（拿 2）約拿在大魚腹中做了什麼？", choices: ["咒詛神", "禱告認罪、稱救恩出於耶和華", "睡覺不理", "寫律法"], correctIndex: 1, feedback: "拿 2:1-10。"),
    QuizQuestion(question: "（拿 3）約拿進尼尼微傳講後，城內有何反應？", choices: ["攻打他", "從王到民禁食披麻悔改", "嘲笑", "殺先知"], correctIndex: 1, feedback: "拿 3:5-10。"),
    QuizQuestion(question: "（拿 4）約拿為何向神發怒？", choices: ["城未毀滅、神仍施憐憫給外邦人", "沒有薪水", "魚太大", "王不聽"], correctIndex: 1, feedback: "拿 4:1-3。"),
    QuizQuestion(question: "（拿 4）神用蓖麻與蟲教導約拿什麼？", choices: ["種菜", "神顧惜尼尼微眾多不能分辨左右手的人與牲畜", "無教訓", "要報仇"], correctIndex: 1, feedback: "拿 4:10-11。"),
  ],
  overviewVideos: const [],
  heroGradient: _p2,
);

final _micah = BookOverview(
  id: "micah",
  shortName: "彌",
  fullName: "彌迦書",
  category: "先知書",
  chapterCount: 7,
  keyTheme: "責備領袖不公、預告審判，卻應許牧者從伯利恆而出與神赦罪復興。",
  keyVerses: const [KeyVerse(reference: "彌 6:8", cuv: "世人哪，耶和华已指示你何为善。他向你所要的是什么呢？只要你行公义，好怜悯，存谦卑的心，与你的神同行。", tncv: "世人哪！耶和華已指示你何為善，他向你所要的是什麼呢？只要你行公義，好憐憫，存謙卑的心，與你的上帝同行。")],
  backgroundIntro: "彌迦向撒馬利亞與耶路撒冷說話，斥責貪腐與假先知，預言錫安被耕如田，"
      "卻指向末後的盼望與伯利恆的統治者。",
  whyImportant: "行公義、好憐憫、謙卑同行是信仰的核心縮影。",
  keyFigures: const [KeyFigure(name: "彌迦", oneLiner: "摩利沙人，向南北國發聲。", emoji: "📣")],
  outline: const [
    OutlineSection(chapterRange: "1–3", title: "審判與領袖", summary: "撒馬利亞、耶路撒冷、領袖啃噬百姓。"),
    OutlineSection(chapterRange: "4–5", title: "末後的國度", summary: "刀打成犁頭、伯利恆以法他出來的掌權者。"),
    OutlineSection(chapterRange: "6–7", title: "訴訟與盼望", summary: "神與百姓的辯論、赦罪與恩待餘民。"),
  ],
  storyHighlights: const [StoryHighlight(title: "伯利恆", description: "統治者從古老而出（聖誕預言）。", chapterLabel: "彌 5:2", chapter: 5)],
  christConnections: const [ChristConnection(otLabel: "伯利恆的嬰孩", ntFulfillment: "太 2:5-6 引用彌 5:2。", verseRef: "太 2:6")],
  applications: const ["以彌 6:8 作每日靈修檢視。"],
  prayerPrompts: const ["主啊，教我行公義、好憐憫，謙卑與祢同行。"],
  songLinks: [SongLink(title: "相關敬拜搜尋", url: _songQ("彌迦書"))],
  quiz: const [
    QuizQuestion(question: "（彌 1–2）開篇審判臨到撒馬利亞與猶大，因何？", choices: ["無原因", "拜偶像、強奪財物、欺壓窮人", "太虔誠", "無戰爭"], correctIndex: 1, feedback: "彌 1:5-7；2:1-2。"),
    QuizQuestion(question: "（彌 3）領袖與先知如何敗壞？", choices: ["熱心公義", "惡善好惡、為賄賂行審判、假平安", "禁食過度", "無過犯"], correctIndex: 1, feedback: "彌 3:5-11。"),
    QuizQuestion(question: "（彌 4–5）末後錫安山與伯利恆的盼望？", choices: ["永遠荒涼", "萬國流歸錫安、掌權者從伯利恆以法他而出", "無彌賽亞", "僅軍事"], correctIndex: 1, feedback: "彌 4:1-2；5:2。"),
    QuizQuestion(question: "（彌 6）神與百姓「訴訟」中，何為善？", choices: ["千千公羊", "行公義、好憐憫、謙卑與神同行", "建金字塔", "攻打列國"], correctIndex: 1, feedback: "彌 6:6-8。"),
    QuizQuestion(question: "（彌 7）書末在敗壞中仍有何盼望？", choices: ["無神", "神赦罪、牧養餘民、應許列祖的恩待", "滅絕選民", "投靠巴比倫偶像"], correctIndex: 1, feedback: "彌 7:18-20。"),
  ],
  overviewVideos: const [],
  heroGradient: _p1,
);

final _nahum = BookOverview(
  id: "nahum",
  shortName: "鴻",
  fullName: "那鴻書",
  category: "先知書",
  chapterCount: 3,
  keyTheme: "宣告殘暴的尼尼微必受報應：神惱恨邪惡，卻向投靠祂的人施恩。",
  keyVerses: const [KeyVerse(reference: "鴻 1:7", cuv: "耶和华本为善，在患难的日子为人的保障，并且认得那些投靠他的人。", tncv: "耶和華本為善，在患難的時候作人的保障；他認識那些投靠他的人。")],
  backgroundIntro: "詩體預言尼尼微的覆滅，對照約拿書時代已過的悔改與後來的暴虐。",
  whyImportant: "在面對壓迫者時，確信神的公義終必臨到。",
  keyFigures: const [KeyFigure(name: "那鴻", oneLiner: "伊勒歌斯人。", emoji: "⚖️")],
  outline: const [
    OutlineSection(chapterRange: "1 章", title: "神的性情", summary: "忌邪施報卻向投靠者施恩。"),
    OutlineSection(chapterRange: "2 章", title: "尼尼微淪陷", summary: "攻城場面與寶物被奪。"),
    OutlineSection(chapterRange: "3 章", title: "為何被毀", summary: "詭詐、擄掠、淫行與商貿暴虐。"),
  ],
  storyHighlights: const [StoryHighlight(title: "尼尼微的結局", description: "強大帝國在神面前倒塌。", chapterLabel: "鴻 2-3", chapter: 2)],
  christConnections: const [ChristConnection(otLabel: "主必申冤", ntFulfillment: "伸冤在主，主必報應（羅 12:19）。", verseRef: "羅 12:19")],
  applications: const ["把對公義的渴望交託神，不以惡報惡。"],
  prayerPrompts: const ["主啊，在邪惡橫行時我投靠祢，信靠祢的時候。"],
  songLinks: [SongLink(title: "相關敬拜搜尋", url: _songQ("那鴻書"))],
  quiz: const [
    QuizQuestion(question: "（鴻 1）開篇強調耶和華對惡人與投靠祂的人如何？", choices: ["不分好歹", "惱恨邪惡、向投靠者施恩，卻不使惡人清淨", "僅慈愛無公義", "沉默"], correctIndex: 1, feedback: "鴻 1:2-3、7。"),
    QuizQuestion(question: "（鴻 2）詩中如何描寫尼尼微淪陷？", choices: ["和平條約", "攻城的車馬、盾牌火紅、搶奪財寶", "無戰爭", "自動投降"], correctIndex: 1, feedback: "鴻 2:3-10。"),
    QuizQuestion(question: "（鴻 3:1–7）尼尼微因何被審？", choices: ["無罪", "流人血、詭詐、淫行、貿易掠奪", "太貧窮", "敬拜耶和華"], correctIndex: 1, feedback: "鴻 3:1-4。"),
    QuizQuestion(question: "（鴻 3:8–13）與挪亞、挪得、亞摩利相比，尼尼微結局？", choices: ["更強永不敗", "無法抵擋耶和華的審判、保障消失", "得埃及援軍", "無關"], correctIndex: 1, feedback: "鴻 3:8-13。"),
    QuizQuestion(question: "（鴻 3:14–19）全書對尼尼微最終斷語？", choices: ["重建更榮耀", "你眾多人民如蟲蟻散去、無人安慰你的損傷", "成聖城", "與以色列合一"], correctIndex: 1, feedback: "鴻 3:15-19。"),
  ],
  overviewVideos: const [],
  heroGradient: _p2,
);

final _habakkuk = BookOverview(
  id: "habakkuk",
  shortName: "哈",
  fullName: "哈巴谷書",
  category: "先知書",
  chapterCount: 3,
  keyTheme: "先知與神對話：為何惡人亨通？神答以巴比倫為刑杖，卻呼召因信得生。",
  keyVerses: const [KeyVerse(reference: "哈 2:4", cuv: "惟义人因信得生。", tncv: "唯義人因信得生。")],
  backgroundIntro: "哈巴谷質疑神的公義，神啟示審判的時刻，先知以頌讚結束於即使無收成仍喜樂。",
  whyImportant: "在困惑中帶疑問到神面前，並學習因信活著（新約保羅引用）。",
  keyFigures: const [KeyFigure(name: "哈巴谷", oneLiner: "與神辯論卻以讚美告終。", emoji: "❓")],
  outline: const [
    OutlineSection(chapterRange: "1 章", title: "第一問與答", summary: "為何容許不公？神將興起迦勒底人。"),
    OutlineSection(chapterRange: "2 章", title: "第二問與五禍", summary: "因信得生、驕傲的五禍。"),
    OutlineSection(chapterRange: "3 章", title: "禱告頌讚", summary: "神從提幔而來、雖無花果仍喜樂。"),
  ],
  storyHighlights: const [StoryHighlight(title: "雖然無花果樹不發旺", description: "環境枯竭仍因神喜樂。", chapterLabel: "哈 3:17-18", chapter: 3)],
  christConnections: const [ChristConnection(otLabel: "因信得生", ntFulfillment: "羅 1:17; 加 3:11 引用哈 2:4。", verseRef: "加 3:11")],
  applications: const ["把「為什麼」帶到禱告中，等候神的答覆與時刻。"],
  prayerPrompts: const ["主啊，在我不明白時，教我因信靠祢而穩固。"],
  songLinks: [SongLink(title: "相關敬拜搜尋", url: _songQ("哈巴谷書"))],
  quiz: const [
    QuizQuestion(question: "（哈 1）先知第一問：為何惡人亨通、神不拯救？", choices: ["無問題", "神答要興起殘忍急促的迦勒底人為刑杖", "立刻滅絕惡人", "沉默不答"], correctIndex: 1, feedback: "哈 1:2-11。"),
    QuizQuestion(question: "（哈 1:12–17）哈巴谷第二疑問是什麼？", choices: ["為何無審判？", "聖潔的神為何用更惡的迦勒底人刑罰？", "為何有聖殿？", "為何要安息日？"], correctIndex: 1, feedback: "哈 1:13：眼目清潔不看邪僻，為何看奸惡？"),
    QuizQuestion(question: "（哈 2）神要哈巴谷如何等候答覆？", choices: ["閉口", "寫明、使讀的人容易讀；義人必因信得生", "離開猶大", "攻打巴比倫"], correctIndex: 1, feedback: "哈 2:2-4。"),
    QuizQuestion(question: "（哈 2:5–20）「五禍」主要針對？", choices: ["窮人", "貪婪、強暴、拜偶像、以人血建城等驕傲者", "兒童", "祭司獨善"], correctIndex: 1, feedback: "哈 2:6-19。"),
    QuizQuestion(question: "（哈 3）結尾雖無花果樹不發旺，先知如何？", choices: ["棄絕神", "因救恩的樂仍喜樂、靠主穩行高地", "自殺", "投靠埃及"], correctIndex: 1, feedback: "哈 3:17-19。"),
  ],
  overviewVideos: const [],
  heroGradient: _p1,
);

final _zephaniah = BookOverview(
  id: "zephaniah",
  shortName: "番",
  fullName: "西番雅書",
  category: "先知書",
  chapterCount: 3,
  keyTheme: "耶和華的日子臨近：普世與猶大受審，謙卑餘民蒙保守，全地歡樂歌唱。",
  keyVerses: const [KeyVerse(reference: "番 3:17", cuv: "耶和华你的神是施行拯救、大有能力的主。他在你中间必因你欢欣喜乐，默然爱你，且因你喜乐而欢呼。", tncv: "耶和華你的上帝在你中間，他是施行拯救的大能者，他必因你歡欣快樂，他在愛中將你更新，並且要因你喜樂歡呼。")],
  backgroundIntro: "約西亞年間，西番雅宣告猶大與列國在耶和華日子裡的審判，並應許謙卑餘民得潔淨與同在。",
  whyImportant: "在審判信息中聽見神對餘民溫柔的歡呼。",
  keyFigures: const [KeyFigure(name: "西番雅", oneLiner: "希西家後裔中的一位先知。", emoji: "📯")],
  outline: const [
    OutlineSection(chapterRange: "1 章", title: "普世與猶大審判", summary: "耶和華的日子、大日臨近。"),
    OutlineSection(chapterRange: "2 章", title: "列邦與謙卑", summary: "非利士、摩押、亞捫、尼尼微、驕傲的城。"),
    OutlineSection(chapterRange: "3 章", title: "耶路撒冷與翻轉", summary: "城中的悖逆、潔淨餘民、神在你中間歡喜。"),
  ],
  storyHighlights: const [StoryHighlight(title: "神默然愛你", description: "審判後恢復親密同在。", chapterLabel: "番 3:17", chapter: 3)],
  christConnections: const [ChristConnection(otLabel: "神與子民同在歡喜", ntFulfillment: "新耶路撒冷神與人同住（啟 21:3）。", verseRef: "啟 21:3")],
  applications: const ["在神的管教中存謙卑，等候祂的恢復。"],
  prayerPrompts: const ["主啊，求祢在我中間因我喜樂，使我聖潔。"],
  songLinks: [SongLink(title: "相關敬拜搜尋", url: _songQ("西番雅書"))],
  quiz: const [
    QuizQuestion(question: "（番 1）「耶和華的大日臨近」時，先知呼籲什麼？", choices: ["宴樂", "在世上勢力如羊無聲無息、尋求公義謙卑", "攻打埃及", "獻金牛"], correctIndex: 1, feedback: "番 1:7-8、14。"),
    QuizQuestion(question: "（番 2）列邦（非利士、摩押、亞捫等）被審判，謙卑的餘民有何應許？", choices: ["滅絕", "可求告耶和華的名、得庇護", "無盼望", "必作奴僕"], correctIndex: 1, feedback: "番 2:3、11。"),
    QuizQuestion(question: "（番 3:1–7）耶路撒冷因何受責？", choices: ["無罪", "悖逆、污穢、欺壓、不信靠神", "太愛窮人", "無祭司"], correctIndex: 1, feedback: "番 3:1-5。"),
    QuizQuestion(question: "（番 3:8–13）神說要施公義、留下什麼樣的餘民？", choices: ["驕傲者", "謙卑、倚靠神名的困苦人", "僅外邦", "無人"], correctIndex: 1, feedback: "番 3:12-13。"),
    QuizQuestion(question: "（番 3:14–20）錫安當如何？神應許同在？", choices: ["繼續哀哭", "應當歌唱、神在你中間施拯救、默然愛你、因你喜樂", "離開聖城", "拜偶像"], correctIndex: 1, feedback: "番 3:14-17。"),
  ],
  overviewVideos: const [],
  heroGradient: _p2,
);

final _haggai = BookOverview(
  id: "haggai",
  shortName: "該",
  fullName: "哈該書",
  category: "先知書",
  chapterCount: 2,
  keyTheme: "歸回後百姓拖延建殿，哈該呼籲省察優先順序，神與他們同在、震動萬國。",
  keyVerses: const [KeyVerse(reference: "該 2:4", cuv: "耶和華說：所羅巴伯啊，雖然如此，你當剛強……", tncv: "耶和華說：所羅巴伯啊，雖然如此，你當剛強……")],
  backgroundIntro: "大流士第二年，哈該與撒迦利亞鼓勵完成聖殿，對比精緻的房屋與荒涼的殿。",
  whyImportant: "提醒教會勿把安逸建築在忽略神國優先之上。",
  keyFigures: const [
    KeyFigure(name: "哈該", oneLiner: "四次帶著耶和華的話激勵百姓。", emoji: "🔨"),
    KeyFigure(name: "所羅巴伯．約撒答的兒子約書亞", oneLiner: "省長與大祭司，回應呼召。", emoji: "🏛️"),
  ],
  outline: const [
    OutlineSection(chapterRange: "1 章", title: "當建殿", summary: "為自己的家跑前、殿荒涼；起來上山取木料。"),
    OutlineSection(chapterRange: "2 章", title: "榮耀與應許", summary: "這殿後來的榮耀更大、震動萬國、大衛的僕人蒙保守。"),
  ],
  storyHighlights: const [StoryHighlight(title: "殿後來的榮耀更大", description: "指向更大榮耀臨到（終極在基督）。", chapterLabel: "該 2:9", chapter: 2)],
  christConnections: const [ChristConnection(otLabel: "神與他們同在", ntFulfillment: "道成肉身以馬內利、教會是聖靈的殿。", verseRef: "約 1:14; 林前 3:16")],
  applications: const ["省察：我把時間金錢最先給誰？神的國是否邊緣化？"],
  prayerPrompts: const ["主啊，激勵我以實際行動服事祢的家與使命。"],
  songLinks: [SongLink(title: "相關敬拜搜尋", url: _songQ("哈該書"))],
  quiz: const [
    QuizQuestion(question: "（該 1:1–11）百姓拖延建殿，先知如何對比？", choices: ["無對比", "住天花板的房屋，耶和華的殿卻荒涼", "聖殿太宏偉", "無人歸回"], correctIndex: 1, feedback: "該 1:4。"),
    QuizQuestion(question: "（該 1:12–15）百姓聽從耶和華後，神如何應許？", choices: ["離棄", "與他們同在、激動他們的心", "降災", "沉默"], correctIndex: 1, feedback: "該 1:13-14。"),
    QuizQuestion(question: "（該 2:1–9）所羅巴伯與約書亞當如何？這殿榮耀？", choices: ["逃跑", "當剛強；後來的榮耀必大過先前的榮耀", "拆毀聖殿", "向波斯造反"], correctIndex: 1, feedback: "該 2:3-9。"),
    QuizQuestion(question: "（該 2:10–19）祭司與百姓在奉獻上的問題？", choices: ["過多奉獻", "因不潔淨使獻上的不蒙悅納、要反省", "無問題", "只獻外邦神"], correctIndex: 1, feedback: "該 2:11-14。"),
    QuizQuestion(question: "（該 2:20–23）神對所羅巴伯有何應許？（書末）", choices: ["廢省長職", "震動萬國、以所羅巴伯為印、大衛僕人蒙保守", "滅絕歸回者", "無應許"], correctIndex: 1, feedback: "該 2:21-23。"),
  ],
  overviewVideos: const [],
  heroGradient: _p1,
);

final _zechariah = BookOverview(
  id: "zechariah",
  shortName: "亞",
  fullName: "撒迦利亞書",
  category: "先知書",
  chapterCount: 14,
  keyTheme: "八個夜間異象鼓勵建殿，預言彌賽亞牧人、耶路撒冷被圍與萬民來敬拜。",
  keyVerses: const [
    KeyVerse(reference: "亞 4:6", cuv: "万军之耶和华说：不是倚靠势力，不是倚靠才能，乃是倚靠我的灵方能成事。", tncv: "萬軍之耶和華說：不是倚靠勢力，不是倚靠才能，乃是倚靠我的靈方能成事。"),
    KeyVerse(reference: "亞 9:9", cuv: "看哪，你的王来到你这里！他是公义的，并且施行拯救，谦谦和和地骑着驴。", tncv: "看哪，你的王來到你這裡！他是公義的，並且施行拯救，謙謙和和地騎著驢。"),
  ],
  backgroundIntro: "歸回後撒迦利亞與哈該同工，以異象、預表與末世圖像指向神的同在與末後拯救。",
  whyImportant: "連結建殿熱情與對彌賽亞榮耀進城的盼望。",
  keyFigures: const [KeyFigure(name: "撒迦利亞", oneLiner: "易多的兒子、祭司家族的先知。", emoji: "🌙")],
  outline: const [
    OutlineSection(chapterRange: "1–6", title: "八異象", summary: "馬、角、準繩、約書亞、燈台與橄欖樹等。"),
    OutlineSection(chapterRange: "7–8", title: "禁食與應許", summary: "真誠的公義憐憫、萬民來歸。"),
    OutlineSection(chapterRange: "9–14", title: "末後拯救", summary: "騎驢的王、牧人擊打、萬國攻耶路撒冷、活水與聖名。"),
  ],
  storyHighlights: const [
    StoryHighlight(title: "約書亞脫污穢衣", description: "大祭司得潔淨與華冠。", chapterLabel: "亞 3", chapter: 3),
    StoryHighlight(title: "謙和騎驢的王", description: "榮耀進城預言。", chapterLabel: "亞 9:9", chapter: 9),
  ],
  christConnections: const [
    ChristConnection(otLabel: "騎驢進耶路撒冷", ntFulfillment: "太 21:4-5 應驗亞 9:9。", verseRef: "太 21:5"),
  ],
  applications: const ["靠聖靈成事，不靠勢力才能（亞 4:6）。"],
  prayerPrompts: const ["主啊，求祢的靈與我同工，完成祢所託付的。"],
  songLinks: [SongLink(title: "相關敬拜搜尋", url: _songQ("撒迦利亞書"))],
  quiz: const [
    QuizQuestion(question: "（亞 1–2）前幾個夜間異象主題？", choices: ["僅家譜", "紅馬巡視全地、四角與匠人、準繩量耶路撒冷等", "十誡", "洪水"], correctIndex: 1, feedback: "亞 1:8-21；2:1-5。"),
    QuizQuestion(question: "（亞 3）大祭司約書亞站在使者面前，如何得潔淨？", choices: ["自建聖殿", "脫去污穢的衣服、穿上華美的衣服、蒙赦罪", "獻千牛", "逃離"], correctIndex: 1, feedback: "亞 3:3-5。"),
    QuizQuestion(question: "（亞 4）金燈台與兩棵橄欖樹旁，神對所羅巴伯說靠什麼成事？", choices: ["靠勢力才能", "靠神的靈方能成事", "靠埃及", "靠刀劍"], correctIndex: 1, feedback: "亞 4:6。"),
    QuizQuestion(question: "（亞 9:9）關於進入耶路撒冷的王如何描述？", choices: ["騎戰馬", "謙和騎驢的公義拯救者", "坐戰車", "步行無人認識"], correctIndex: 1, feedback: "亞 9:9；太 21:5 引用。"),
    QuizQuestion(question: "（亞 14）末後耶路撒冷被圍、活水與聖名的主題？", choices: ["無末世", "耶和華必作全地的王、活水從耶路撒冷流出、萬國來敬拜", "僅歷史", "廢除聖殿"], correctIndex: 1, feedback: "亞 14:8-9、16。"),
  ],
  overviewVideos: const [],
  heroGradient: _p2,
);

final _malachi = BookOverview(
  id: "malachi",
  shortName: "瑪",
  fullName: "瑪拉基書",
  category: "先知書",
  chapterCount: 4,
  keyTheme: "神與百姓辯論：藐視祭物、十一奉獻與婚姻，預告使者與公義日臨到。",
  keyVerses: const [
    KeyVerse(reference: "瑪 3:10", cuv: "万军之耶和华说：你们要将当纳的十分之一全然送入仓库……", tncv: "萬軍之耶和華說：你們要把當納的十分之一全然送入倉庫……"),
    KeyVerse(reference: "瑪 4:5-6", cuv: "看哪，耶和华大而可畏之日未到以前，我必差遣先知以利亚到你们那里去。", tncv: "看哪，耶和華大而可畏的日子未到以前，我必差遣先知以利亞到你們那裡去。"),
  ],
  backgroundIntro: "舊約末卷，以對話體責備祭司與百姓的形式主義，應許煉淨與公義的太陽興起。",
  whyImportant: "連結到新約施洗約翰「以利亞職事」與瑪拉基之間的橋樑。",
  keyFigures: const [KeyFigure(name: "瑪拉基", oneLiner: "意為「我的使者」，信息強調神的信實。", emoji: "✉️")],
  outline: const [
    OutlineSection(chapterRange: "1–2", title: "愛與祭司瀆職", summary: "雅各蒙愛、以掃被惡、休妻與詭詐。"),
    OutlineSection(chapterRange: "3", title: "使者與奉獻", summary: "煉淨利未人、搶奪神的物與十一。"),
    OutlineSection(chapterRange: "4", title: "公義日與以利亞", summary: "烈日與醫治、心轉向父子。"),
  ],
  storyHighlights: const [StoryHighlight(title: "萬軍之耶和華說", description: "反覆辯論格式凸顯百姓麻木。", chapterLabel: "瑪 全書", chapter: 1)],
  christConnections: const [
    ChristConnection(otLabel: "立約的使者", ntFulfillment: "基督是神與人之間的中保。", verseRef: "來 9:15"),
    ChristConnection(otLabel: "以利亞將來", ntFulfillment: "約翰似以利亞預備主道（太 11:14）。", verseRef: "太 11:14"),
  ],
  applications: const ["誠實檢視奉獻與敬拜是否「殘疾的祭物」心態。"],
  prayerPrompts: const ["主啊，煉淨我，使我以正直敬畏事奉祢。"],
  songLinks: [SongLink(title: "相關敬拜搜尋", url: _songQ("瑪拉基書"))],
  quiz: const [
    QuizQuestion(question: "（瑪 1）神為何厭棄祭物？", choices: ["百姓太虔誠", "獻瞎瘸的牲畜、藐視我名", "無祭司", "無聖殿"], correctIndex: 1, feedback: "瑪 1:6-8。"),
    QuizQuestion(question: "（瑪 2）祭司與百姓在婚姻、律法教導上何罪？", choices: ["無罪", "背約休妻、以詭詐待同伴、使律法失職", "太愛窮人", "獻太多"], correctIndex: 1, feedback: "瑪 2:10-17。"),
    QuizQuestion(question: "（瑪 3:1–5）神應許差來的使者與立約的使者要做什麼？", choices: ["廢律法", "煉淨利未人、速速作見證除惡", "建金字塔", "無作為"], correctIndex: 1, feedback: "瑪 3:1-5。"),
    QuizQuestion(question: "（瑪 3:6–12）神責備百姓搶奪什麼？當如何？", choices: ["搶奪鄰舍財物、當賠還", "搶奪神的物（十分之一與供物）、當送入倉庫試試神", "無需奉獻", "只獻心"], correctIndex: 1, feedback: "瑪 3:8-10。"),
    QuizQuestion(question: "（瑪 4）大而可畏的日子未到前，神差遣誰？心要如何？", choices: ["法老", "差遣以利亞，使父心轉向兒女、兒女轉向父", "尼布甲尼撒", "無人"], correctIndex: 1, feedback: "瑪 4:5-6；施洗約翰似以利亞。"),
  ],
  overviewVideos: const [],
  heroGradient: _p1,
);
