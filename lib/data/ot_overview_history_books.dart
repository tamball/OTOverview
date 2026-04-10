import "package:flutter/material.dart";

import "../models/book_overview.dart";

BookOverview? historyOtBookOverview(String id) {
  switch (id) {
    case "joshua":
      return _joshua;
    case "judges":
      return _judges;
    case "ruth":
      return _ruth;
    case "1_samuel":
      return overview1Samuel;
    case "2_samuel":
      return overview2Samuel;
    case "1_kings":
      return overview1Kings;
    case "2_kings":
      return overview2Kings;
    case "1_chronicles":
      return overview1Chronicles;
    case "2_chronicles":
      return overview2Chronicles;
    case "ezra":
      return _ezra;
    case "nehemiah":
      return _nehemiah;
    case "esther":
      return _esther;
    default:
      return null;
  }
}

final _gradH1 = [const Color(0xFF0D47A1), const Color(0xFF1976D2), const Color(0xFF64B5F6)];
final _gradH2 = [const Color(0xFF4E342E), const Color(0xFF6D4C41), const Color(0xFFBCAAA4)];

String _songQ(String name) =>
    "https://www.youtube.com/results?search_query=${Uri.encodeComponent("$name 聖經 詩歌")}";

final _joshua = BookOverview(
  id: "joshua",
  shortName: "書",
  fullName: "約書亞記",
  category: "歷史書",
  chapterCount: 24,
  keyTheme: "神信實成就應許，帶領百姓進入迦南；呼召子民專心愛主、除去偶像。",
  keyVerses: const [
    KeyVerse(
      reference: "書 1:9",
      cuv: "我豈沒有吩咐你嗎？你當剛強壯膽……耶和華你的神豈不是你隨處同在嗎？",
      tncv: "我不是吩咐過你嗎？你要剛強勇敢……耶和華你的上帝不是與你同在嗎？",
    ),
    KeyVerse(
      reference: "書 24:15",
      cuv: "至於我和我家，我們必定事奉耶和華。",
      tncv: "至於我和我家，我們必定事奉耶和華。",
    ),
  ],
  backgroundIntro: "接續摩西之後，約書亞率領新一代過約旦河、攻取迦南地，並按支派分地。"
      "本書強調神的應許必定成就，也提醒得地之後仍要持守聖約。",
  whyImportant: "幫助我們在「進入應許」的旅程中，學習信靠、順服與分別為聖。",
  keyFigures: const [
    KeyFigure(name: "約書亞", oneLiner: "承接使命的領袖，經歷神同在的大能。", emoji: "🛡️"),
    KeyFigure(name: "喇合", oneLiner: "因信接待探子，被納入神子民的故事。", emoji: "🏠"),
    KeyFigure(name: "亞干", oneLiner: "隱罪連累全營，顯明聖潔與群體責任。", emoji: "⚠️"),
  ],
  outline: const [
    OutlineSection(chapterRange: "1–5 章", title: "進入應許", summary: "過約旦河、攻耶利哥，以信心踏出第一步。"),
    OutlineSection(chapterRange: "6–12 章", title: "征服與分地", summary: "南征北討、擊敗諸王，支派承受產業。"),
    OutlineSection(chapterRange: "13–24 章", title: "立約與遺命", summary: "未得之地提醒、立約於示劍、約書亞臨終勸勉。"),
  ],
  storyHighlights: const [
    StoryHighlight(title: "耶利哥城牆", description: "繞城與吹角，彰顯爭戰屬乎神。", chapterLabel: "書 6", chapter: 6),
    StoryHighlight(title: "日月停住", description: "為爭戰向神呼求，神垂聽大能作為。", chapterLabel: "書 10", chapter: 10),
  ],
  christConnections: const [
    ChristConnection(
      otLabel: "進入安息與應許",
      ntFulfillment: "基督使我們進入真安息，承受屬靈產業。",
      verseRef: "來 4:8-11",
    ),
    ChristConnection(
      otLabel: "元帥耶和華的軍隊",
      ntFulfillment: "屬靈爭戰靠主得勝，非靠勢力才能。",
      verseRef: "弗 6:10-13",
    ),
  ],
  applications: const [
    "面對新階段時，默想「剛強壯膽」：神與我同在。",
    "檢視生命中是否有當「除去」的隱罪或偶像。",
    "為家庭與小組立志：我們要事奉耶和華。",
  ],
  prayerPrompts: const [
    "主啊，求祢幫助我凭信踏出祢所量給我的下一步。",
    "願我家以事奉祢為中心，不靠自己的力氣爭戰。",
  ],
  songLinks: [SongLink(title: "相關敬拜搜尋", url: _songQ("約書亞記"))],
  quiz: const [
    QuizQuestion(
      question: "（書 1）摩西死後，誰承接帶領百姓進迦南？",
      choices: ["亞倫", "約書亞", "迦勒", "非尼哈"],
      correctIndex: 1,
      feedback: "書 1:1-2：耶和華勉約書亞剛強壯膽。",
    ),
    QuizQuestion(
      question: "（書 3–4）以色列如何過約旦河進入應許之地？",
      choices: ["造船渡河", "祭司抬約櫃先下河、百姓跟從乾地", "摩西舉杖分海", "繞行上游"],
      correctIndex: 1,
      feedback: "書 3-4：抬約櫃的祭司腳站河中，水斷流。",
    ),
    QuizQuestion(
      question: "（書 6）耶利哥城如何陷落？",
      choices: ["挖地道", "照神吩咐繞城、第七日吹角吶喊", "火攻", "談判開城"],
      correctIndex: 1,
      feedback: "書 6：第七日繞城七次後城牆塌陷。",
    ),
    QuizQuestion(
      question: "（書 7–8）艾城初戰慘敗，主要因誰取了當滅之物？",
      choices: ["約書亞", "亞干", "亞倫", "喇合"],
      correctIndex: 1,
      feedback: "書 7：亞干隱藏當滅之物，全營受連累。",
    ),
    QuizQuestion(
      question: "（書 24）約書亞在示劍臨終前呼籲百姓做何抉擇？",
      choices: ["建造聖殿", "至於我和我家必定事奉耶和華", "回埃及", "另立偶像"],
      correctIndex: 1,
      feedback: "書 24:15：明確選擇所要事奉的神。",
    ),
  ],
  overviewVideos: const [],
  heroGradient: _gradH1,
);

final _judges = BookOverview(
  id: "judges",
  shortName: "士",
  fullName: "士師記",
  category: "歷史書",
  chapterCount: 21,
  keyTheme: "沒有王、各人任意而行的世代中，神興起士師拯救悔改的百姓。",
  keyVerses: const [
    KeyVerse(
      reference: "士 17:6",
      cuv: "那時，沒有王，各人任意而行。",
      tncv: "那時沒有王，各人任意而行。",
    ),
    KeyVerse(
      reference: "士 2:16",
      cuv: "耶和華興起士師，士師就拯救他們脫離搶奪他們人的手。",
      tncv: "耶和華興起士師，士師就拯救他們脫離搶奪他們之人的手。",
    ),
  ],
  backgroundIntro: "進入迦南後，百姓反覆背約、受壓迫、呼求、蒙拯救的循環。"
      "士師是神所興起的拯救者，卻也暴露人性與領袖的軟弱。",
  whyImportant: "提醒我們：真正的王權與秩序在神；人心偏離時需要悔改與更新。",
  keyFigures: const [
    KeyFigure(name: "底波拉", oneLiner: "女先知與士師，與巴拉同心事奉。", emoji: "📜"),
    KeyFigure(name: "基甸", oneLiner: "從膽怯到憑神記號與少數人得勝。", emoji: "🔥"),
    KeyFigure(name: "參孫", oneLiner: "力大卻情慾失控，結局仍顯神旨意。", emoji: "💪"),
  ],
  outline: const [
    OutlineSection(chapterRange: "1–3 章", title: "引言與循環", summary: "約書亞死後的失敗模式與神的審判拯救。"),
    OutlineSection(chapterRange: "3–16 章", title: "士師事蹟", summary: "俄陀聶、以笏、底波拉、基甸、耶弗他、參孫等。"),
    OutlineSection(chapterRange: "17–21 章", title: "宗教與道德混亂", summary: "米迦偶像、利未人悲劇、基列‧雅比的慘事。"),
  ],
  storyHighlights: const [
    StoryHighlight(title: "基甸的三百人", description: "神刻意減少人數，免得人誇口。", chapterLabel: "士 7", chapter: 7),
    StoryHighlight(title: "參孫的呼求", description: "在失敗盡頭仍向神呼求最後一次力氣。", chapterLabel: "士 16", chapter: 16),
  ],
  christConnections: const [
    ChristConnection(
      otLabel: "士師作拯救者",
      ntFulfillment: "基督是終極拯救者與真王，一次永遠解決罪與死。",
      verseRef: "來 7:25",
    ),
  ],
  applications: const [
    "省察自己是否「任意而行」：誰是我生命的主？",
    "在軟弱中學習呼求神，不靠自己的聰明或勢力。",
  ],
  prayerPrompts: const [
    "主啊，求祢作我生命的王，我不任意偏行。",
  ],
  songLinks: [SongLink(title: "相關敬拜搜尋", url: _songQ("士師記"))],
  quiz: const [
    QuizQuestion(
      question: "（士 1–2）約書亞死後，本書如何描述以色列與迦南諸族的處境？",
      choices: ["立刻統一全地", "未能完全趕出居民、反覆背約受壓迫的循環開始", "立刻建聖殿", "無戰爭"],
      correctIndex: 1,
      feedback: "士 2：耶和華的使者責備，士師循環敘事展開。",
    ),
    QuizQuestion(
      question: "（士 4–5）女先知底波拉與誰同去對付西西拉？",
      choices: ["掃羅", "巴拉", "基甸", "參孫"],
      correctIndex: 1,
      feedback: "士 4-5：底波拉與巴拉凱歌。",
    ),
    QuizQuestion(
      question: "（士 7）神把基甸的軍兵減到三百，主要目的？",
      choices: ["節省糧草", "免得以色列向耶和華誇口，顯明得勝在乎神", "敵軍太弱", "基甸膽怯"],
      correctIndex: 1,
      feedback: "士 7:2：免得以色列人誇口。",
    ),
    QuizQuestion(
      question: "（士 13–16）參孫力大無窮，最終如何與非利士人同歸於盡？",
      choices: ["投河", "推倒廟宇柱子", "決鬥陣亡", "被擄老死"],
      correctIndex: 1,
      feedback: "士 16:29-30：參孫推倒柱子。",
    ),
    QuizQuestion(
      question: "（士 17–21）本書結尾反覆出現哪句主題話？",
      choices: ["願頌讚歸於神", "那時沒有王，各人任意而行", "耶和華如此說", "阿們"],
      correctIndex: 1,
      feedback: "士 17:6、18:1、19:1、21:25 等。",
    ),
  ],
  overviewVideos: const [],
  heroGradient: _gradH2,
);

final _ruth = BookOverview(
  id: "ruth",
  shortName: "得",
  fullName: "路得記",
  category: "歷史書",
  chapterCount: 4,
  keyTheme: "在荒年與喪親中，忠誠、恩慈與神的照管交織成救贖之愛的故事。",
  keyVerses: const [
    KeyVerse(
      reference: "得 1:16",
      cuv: "你的國就是我的國，你的神就是我的神。",
      tncv: "你的國就是我的國，你的上帝就是我的上帝。",
    ),
    KeyVerse(
      reference: "得 4:14",
      cuv: "耶和華是應當稱頌的……有這兒婦比有七個兒子還好。",
      tncv: "耶和華是應當稱頌的……有這媳婦比有七個兒子更好。",
    ),
  ],
  backgroundIntro: "士師時代背景下，摩押女子路得跟隨婆婆拿俄米回到伯利恆，蒙波阿斯以近親贖回者身分照顧，"
      "成為大衛（並至彌賽亞）家譜中的一環。",
  whyImportant: "示範在平凡與苦難中仍選擇信靠神，並預表外邦人蒙恩進入救贖計劃。",
  keyFigures: const [
    KeyFigure(name: "路得", oneLiner: "捨己跟隨婆婆與以色列的神。", emoji: "🌾"),
    KeyFigure(name: "拿俄米", oneLiner: "從苦澀到看見神的恩慈恢復。", emoji: "👵"),
    KeyFigure(name: "波阿斯", oneLiner: "恩慈、公義的近親贖回者。", emoji: "🤝"),
  ],
  outline: const [
    OutlineSection(chapterRange: "1 章", title: "離與歸", summary: "拿俄米與路得從摩押回到伯利恆。"),
    OutlineSection(chapterRange: "2–3 章", title: "拾穗與求婚", summary: "波阿斯田間的保護與至近的贖回。"),
    OutlineSection(chapterRange: "4 章", title: "贖回與家譜", summary: "波阿斯娶路得，大衛的祖父俄備得出生。"),
  ],
  storyHighlights: const [
    StoryHighlight(title: "你的神就是我的神", description: "路得立約式的跟隨。", chapterLabel: "得 1", chapter: 1),
    StoryHighlight(title: "腳下的衣襟", description: "至近親屬的禮儀與波阿斯的承諾。", chapterLabel: "得 3", chapter: 3),
  ],
  christConnections: const [
    ChristConnection(
      otLabel: "波阿斯作近親贖回者",
      ntFulfillment: "基督是真贖回者，買贖屬祂的子民。",
      verseRef: "彼前 1:18-19",
    ),
    ChristConnection(
      otLabel: "外邦女子進入家譜",
      ntFulfillment: "救恩臨到萬邦，在基督裡合而為一。",
      verseRef: "弗 2:13-14",
    ),
  ],
  applications: const [
    "在關係中操練忠誠與恩慈，像路得與波阿斯。",
    "在逆境中相信神仍在編織故事。",
  ],
  prayerPrompts: const [
    "主啊，願我甘心跟隨祢，像路得選擇祢作我的神。",
  ],
  songLinks: [SongLink(title: "相關敬拜搜尋", url: _songQ("路得記"))],
  quiz: const [
    QuizQuestion(
      question: "（得 1）拿俄米從摩押回伯利恆時，誰執意跟隨並說「你的神就是我的神」？",
      choices: ["俄珥巴", "路得", "波阿斯", "以利米勒"],
      correctIndex: 1,
      feedback: "得 1:16-18 路得與婆婆同去。",
    ),
    QuizQuestion(
      question: "（得 2）波阿斯在麥田如何恩待拾穗的路得？",
      choices: ["趕她離開", "吩咐僕人不可欺負她、任她在波阿斯田間拾穗", "罰款", "囚禁"],
      correctIndex: 1,
      feedback: "得 2:8-9：保護與供應。",
    ),
    QuizQuestion(
      question: "（得 3）路得按婆婆指示到禾場見波阿斯，主要與什麼禮儀有關？",
      choices: ["獻祭條例", "至近親屬／贖回相關的暗示", "割禮", "逾越節宰羊"],
      correctIndex: 1,
      feedback: "得 3：腳下衣襟與至近的議題。",
    ),
    QuizQuestion(
      question: "（得 4）波阿斯在城門長老前完成什麼，得以娶路得？",
      choices: ["打仗凱旋", "買贖產業與娶路得的權利", "獻殿", "寫詩篇"],
      correctIndex: 1,
      feedback: "得 4：脫鞋禮、買贖。",
    ),
    QuizQuestion(
      question: "（得 4 末）家譜從波阿斯、路得之兒指向誰？",
      choices: ["所羅門", "大衛", "撒母耳", "掃羅"],
      correctIndex: 1,
      feedback: "俄備得生耶西，耶西生大衛（得 4:21-22）。",
    ),
  ],
  overviewVideos: const [],
  heroGradient: [const Color(0xFF5D4037), const Color(0xFF8D6E63), const Color(0xFFFFCC80)],
);

final overview1Samuel = BookOverview(
  id: "1_samuel",
  shortName: "撒上",
  fullName: "撒母耳記上",
  category: "歷史書",
  chapterCount: 31,
  keyTheme: "從士師時代過渡到君王時代：神掌權、人的祈求與掃羅、大衛的對比。",
  keyVerses: const [
    KeyVerse(
      reference: "撒上 16:7",
      cuv: "耶和華不像人看人……耶和華是看內心。",
      tncv: "耶和華不像人看人……耶和華是看內心。",
    ),
    KeyVerse(
      reference: "撒上 13:14",
      cuv: "耶和華已經尋著一個合他心意的人，立他作百姓的君。",
      tncv: "耶和華已經找到一個合他心意的人，立他作人民的君王。",
    ),
  ],
  backgroundIntro: "撒母耳出身與蒙召、以色列求立王、掃羅被膏與失職、大衛受膏與面對掃羅追殺。"
      "本卷凸顯「順服神」與「合神心意」的領袖本質。",
  whyImportant: "幫助我們檢視：我們要的是「像列國的王」還是神所揀選的牧者？",
  keyFigures: const [
    KeyFigure(name: "撒母耳", oneLiner: "先知、士師、立王的重要器皿。", emoji: "🕯️"),
    KeyFigure(name: "掃羅", oneLiner: "起初受膏卻因悖逆失去王位。", emoji: "👑"),
    KeyFigure(name: "大衛", oneLiner: "合神心意，在試煉中學習等候。", emoji: "🎵"),
  ],
  outline: const [
    OutlineSection(chapterRange: "1–7 章", title: "撒母耳與約櫃", summary: "哈拿禱告、撒母耳蒙召、約櫃被擄與歸回。"),
    OutlineSection(chapterRange: "8–15 章", title: "掃羅作王", summary: "百姓求王、掃羅受膏與多次悖逆。"),
    OutlineSection(chapterRange: "16–31 章", title: "大衛興起", summary: "大衛受膏、擊殺歌利亞、逃避掃羅、掃羅陣亡。"),
  ],
  storyHighlights: const [
    StoryHighlight(title: "大衛與歌利亞", description: "靠萬軍之耶和華的名爭戰。", chapterLabel: "撒上 17", chapter: 17),
    StoryHighlight(title: "約拿單與大衛", description: "盟約之愛勝過嫉妒與王位。", chapterLabel: "撒上 18-20", chapter: 18),
  ],
  christConnections: const [
    ChristConnection(
      otLabel: "大衛作牧者與君王預表",
      ntFulfillment: "耶穌是真牧者、永遠的君王。",
      verseRef: "約 10:11",
    ),
  ],
  applications: const [
    "神看重內心過於外貌：在服事中操練誠實與謙卑。",
    "在逼迫或不公中，學習大衛不親手害「耶和華的受膏者」。",
  ],
  prayerPrompts: const [
    "主啊，求祢使我合祢心意，不靠自己的聰明強出頭。",
  ],
  songLinks: [SongLink(title: "相關敬拜搜尋", url: _songQ("撒母耳記上"))],
  quiz: const [
    QuizQuestion(
      question: "（撒上 1）哈拿在示羅向神懇切做什麼，後來生下撒母耳？",
      choices: ["獻殿", "禱告求子並許願獻上", "跳舞", "建壇"],
      correctIndex: 1,
      feedback: "撒上 1:10-11、20。",
    ),
    QuizQuestion(
      question: "（撒上 3）少年撒母耳如何知道是耶和華呼召他？",
      choices: ["做夢", "在以利指導下回應「請說，僕人敬聽」", "見異象火柱", "天使顯現"],
      correctIndex: 1,
      feedback: "撒上 3：以利教他分辨耶和華的聲音。",
    ),
    QuizQuestion(
      question: "（撒上 8–10）百姓堅持要像列國一樣有王，首位受膏的王是？",
      choices: ["大衛", "掃羅", "所羅門", "撒母耳"],
      correctIndex: 1,
      feedback: "撒上 10：掃羅被膏立。",
    ),
    QuizQuestion(
      question: "（撒上 16）神對撒母耳說「不像人看人」，在耶西眾子中揀選誰？",
      choices: ["掃羅", "大衛", "以利押", "約拿單"],
      correctIndex: 1,
      feedback: "撒上 16:12-13：牧放羊群的幼子大衛。",
    ),
    QuizQuestion(
      question: "（撒上 17）誰靠萬軍之耶和華的名擊殺歌利亞？",
      choices: ["掃羅", "約拿單", "大衛", "撒母耳"],
      correctIndex: 2,
      feedback: "撒上 17：大衛用机弦甩石。",
    ),
  ],
  overviewVideos: const [],
  heroGradient: _gradH1,
);

final overview2Samuel = BookOverview(
  id: "2_samuel",
  shortName: "撒下",
  fullName: "撒母耳記下",
  category: "歷史書",
  chapterCount: 24,
  keyTheme: "大衛作王、國度擴展與其個人失敗的悔改；神的慈愛與公義並行。",
  keyVerses: const [
    KeyVerse(
      reference: "撒下 7:16",
      cuv: "你的家和你的國必在我面前永遠堅立。你的國位也必堅定，直到永遠。",
      tncv: "你的家和你的國必在我面前永遠堅立。你的國位也必堅定，直到永遠。",
    ),
    KeyVerse(
      reference: "撒下 12:13",
      cuv: "耶和華已經除掉你的罪，你必不至於死。",
      tncv: "耶和華已經除掉你的罪，你必不會死。",
    ),
  ],
  backgroundIntro: "大衛在希伯崙與耶路撒冷作王、約櫃運入、神應許大衛之約、大衛犯罪與悔改、"
      "宮廷紛爭與押沙龍叛變。本卷是王國高峰與人性軟弱並陳。",
  whyImportant: "示範真悔改與神的赦免，並指向那永不動搖的大衛之約應驗於基督。",
  keyFigures: const [
    KeyFigure(name: "大衛", oneLiner: "合神心意卻仍會犯罪、肯認罪悔改的君王。", emoji: "👑"),
    KeyFigure(name: "拿單", oneLiner: "勇敢指出君王之罪的先知。", emoji: "📣"),
    KeyFigure(name: "約押", oneLiner: "元帥的忠勇與手段的爭議。", emoji: "⚔️"),
  ],
  outline: const [
    OutlineSection(chapterRange: "1–10 章", title: "鞏固王位", summary: "作猶大與以色列王、約櫃、神與大衛立約。"),
    OutlineSection(chapterRange: "11–20 章", title: "犯罪與後果", summary: "拔示巴、暗殺烏利亞、家庭悲劇與押沙龍。"),
    OutlineSection(chapterRange: "21–24 章", title: "後記與讚美", summary: "饑荒與掃羅家、大衛數點百姓與悔改、詩篇頌讚。"),
  ],
  storyHighlights: const [
    StoryHighlight(title: "大衛之約", description: "神應許大衛後裔堅立國位。", chapterLabel: "撒下 7", chapter: 7),
    StoryHighlight(title: "「我得罪耶和華了」", description: "拿單責備後的真實悔改。", chapterLabel: "撒下 12", chapter: 12),
  ],
  christConnections: const [
    ChristConnection(
      otLabel: "大衛之約：永遠的國位",
      ntFulfillment: "基督從大衛後裔而生，作永遠的君王。",
      verseRef: "路 1:32-33",
    ),
  ],
  applications: const [
    "犯罪後願意像大衛一樣承認「得罪神」，不靠辯解。",
    "思想神的赦免與管教如何同時臨到。",
  ],
  prayerPrompts: const [
    "主啊，求祢光照我隱藏的罪，使我悔改得潔淨。",
  ],
  songLinks: [SongLink(title: "相關敬拜搜尋", url: _songQ("撒母耳記下"))],
  quiz: const [
    QuizQuestion(
      question: "（撒下 1–5）掃羅陣亡後，大衛先在哪裡作王，後又統一以色列？",
      choices: ["只在耶路撒冷", "先希伯崙作猶大王，後進耶路撒冷作全以色列王", "只在埃及", "只在基列"],
      correctIndex: 1,
      feedback: "撒下 2、5：由猶大到全國。",
    ),
    QuizQuestion(
      question: "（撒下 6–7）約櫃運入大衛城後，神透過先知拿單應許大衛什麼？",
      choices: ["立刻建殿完工", "堅立家室與國位直到永遠（大衛之約）", "廢王位", "征服希臘"],
      correctIndex: 1,
      feedback: "撒下 7：大衛之約。",
    ),
    QuizQuestion(
      question: "（撒下 11–12）拿單責備大衛與拔示巴、烏利亞事件後，大衛如何回應？",
      choices: ["否認", "認罪「我得罪耶和華了」", "殺拿單", "逃亡非利士"],
      correctIndex: 1,
      feedback: "撒下 12:13：認罪與赦免之言。",
    ),
    QuizQuestion(
      question: "（撒下 15–18）叛變追殺大衛、後死在樹林中的是誰？",
      choices: ["約押", "押沙龍", "亞多尼雅", "示每"],
      correctIndex: 1,
      feedback: "撒下 18：押沙龍頭髮被樹卡住。",
    ),
    QuizQuestion(
      question: "（撒下 24）本書末段大衛數點百姓後遭遇瘟疫，最後如何止息？",
      choices: ["約押獻祭", "大衛在亞勞拿禾場築壇獻祭蒙神止息", "非利士退兵", "約櫃送回"],
      correctIndex: 1,
      feedback: "撒下 24:18-25：獻祭止瘟疫。",
    ),
  ],
  overviewVideos: const [],
  heroGradient: _gradH2,
);

final overview1Kings = BookOverview(
  id: "1_kings",
  shortName: "王上",
  fullName: "列王紀上",
  category: "歷史書",
  chapterCount: 22,
  keyTheme: "所羅門的智慧與聖殿、王國分裂與北國邪惡王朝中的先知以利亞。",
  keyVerses: const [
    KeyVerse(
      reference: "王上 8:60",
      cuv: "使地上萬民都知道惟獨耶和華是神，並無別神。",
      tncv: "使地上萬民都知道惟獨耶和華是神，並沒有別神。",
    ),
    KeyVerse(
      reference: "王上 18:21",
      cuv: "你們心持兩意要到幾時呢？若耶和華是神，就當順從耶和華。",
      tncv: "你們心懷二意要到幾時呢？若耶和華是上帝，就當順從耶和華。",
    ),
  ],
  backgroundIntro: "大衛晚年、所羅門登基建殿與智慧、王國分裂為南北、巴力崇拜與以利亞在迦密山的事奉。",
  whyImportant: "認識敬拜真神與政治宗教妥協的危險，並仰望神在黑暗中的見證人。",
  keyFigures: const [
    KeyFigure(name: "所羅門", oneLiner: "智慧與榮耀高峰，晚年卻有警戒。", emoji: "🏛️"),
    KeyFigure(name: "以利亞", oneLiner: "為耶和華大能作證的先知。", emoji: "⚡"),
    KeyFigure(name: "亞哈", oneLiner: "纵容耶洗別、引進巴力的北王。", emoji: "❌"),
  ],
  outline: const [
    OutlineSection(chapterRange: "1–11 章", title: "所羅門", summary: "繼位、智慧、建殿、列國聲望與後來跌倒。"),
    OutlineSection(chapterRange: "12–16 章", title: "分裂與諸王", summary: "王國分裂、南北諸王興替。"),
    OutlineSection(chapterRange: "17–22 章", title: "以利亞事工", summary: "曠野、寡婦、迦密山、亞哈陣亡。"),
  ],
  storyHighlights: const [
    StoryHighlight(title: "所羅門禱告與奉獻聖殿", description: "為神的名與百姓禱告。", chapterLabel: "王上 8", chapter: 8),
    StoryHighlight(title: "迦密山上的抉擇", description: "耶和華降火顯明為真神。", chapterLabel: "王上 18", chapter: 18),
  ],
  christConnections: const [
    ChristConnection(
      otLabel: "聖殿與神同在",
      ntFulfillment: "基督是道成肉身的帳幕，身體是聖靈的殿。",
      verseRef: "約 1:14; 林前 6:19",
    ),
  ],
  applications: const [
    "今日是否「心持兩意」？在信仰與世界價值間明確選擇神。",
  ],
  prayerPrompts: const [
    "主啊，惟願萬民知道祢是獨一真神。",
  ],
  songLinks: [SongLink(title: "相關敬拜搜尋", url: _songQ("列王紀"))],
  quiz: const [
    QuizQuestion(
      question: "（王上 1–2）大衛晚年，誰接續所羅門穩坐王位？",
      choices: ["亞多尼雅如願", "所羅門在撒督、拿單等支持下登基", "約押", "亞比煞"],
      correctIndex: 1,
      feedback: "王上 1-2：所羅門繼位。",
    ),
    QuizQuestion(
      question: "（王上 6–8）耶和華的殿主要在誰在位時建成並舉行奉獻禱告？",
      choices: ["大衛", "所羅門", "羅波安", "亞哈"],
      correctIndex: 1,
      feedback: "王上 6-8：建殿與所羅門禱告。",
    ),
    QuizQuestion(
      question: "（王上 11）所羅門晚年何種行為為王國留下破口？",
      choices: ["熱心獨一敬拜", "寵愛外邦妃嬪、為她們建丘壇偏離專一敬拜", "廢祭司", "拆毀聖殿"],
      correctIndex: 1,
      feedback: "王上 11：妃嬪與偶像崇拜。",
    ),
    QuizQuestion(
      question: "（王上 12）羅波安拒絕減負後，王國分裂為南北，南國中心在？",
      choices: ["撒馬利亞", "耶路撒冷", "但", "大馬士革"],
      correctIndex: 1,
      feedback: "王上 12：南國猶大以耶路撒冷為都。",
    ),
    QuizQuestion(
      question: "（王上 18）迦密山上以利亞與巴力先知對決，結果如何？",
      choices: ["巴力降火", "耶和華降火燒盡燔祭", "和局", "雙方撤退"],
      correctIndex: 1,
      feedback: "王上 18:38-39：耶和華降火。",
    ),
  ],
  overviewVideos: const [],
  heroGradient: _gradH1,
);

final overview2Kings = BookOverview(
  id: "2_kings",
  shortName: "王下",
  fullName: "列王紀下",
  category: "歷史書",
  chapterCount: 25,
  keyTheme: "北國滅亡、南國興衰、以賽亞與希西家、約西亞改革至被擄巴比倫的審判與盼望。",
  keyVerses: const [
    KeyVerse(
      reference: "王下 22:19",
      cuv: "因你聽見我指著此地和其所住的民所說要變為荒場、受咒詛的話……心裡敬服。",
      tncv: "因為你聽見我指著這地和這地上的居民所說要變為荒廢、受咒詛的話……心裡敬服。",
    ),
    KeyVerse(
      reference: "王下 19:19",
      cuv: "耶和華我們的神啊，求你拯救我們脫離他的手，使天下萬國都知道惟獨你是耶和華神。",
      tncv: "耶和華──我們的上帝啊，現在求你救我們脫離亞述王的手，使天下萬國都知道惟有你是耶和華。",
    ),
  ],
  backgroundIntro: "接續列王紀上，記載以利沙事工、南北國諸王、亞述滅北國、巴比倫滅南國與約雅斤被恩待。"
      "本卷是審判的歷史，也保留悔改與神記念的種子。",
  whyImportant: "明白背約的後果與神的公義，並在被擄敘事中預備讀者進入先知書與歸回故事。",
  keyFigures: const [
    KeyFigure(name: "以利沙", oneLiner: "承接以利亞、行神蹟與牧養先知門徒。", emoji: "✨"),
    KeyFigure(name: "希西家", oneLiner: "依靠神脫離亞述威脅、禱告得醫治。", emoji: "🙏"),
    KeyFigure(name: "約西亞", oneLiner: "發現律法書後推行改革。", emoji: "📖"),
  ],
  outline: const [
    OutlineSection(chapterRange: "1–17 章", title: "以利沙與兩國諸王", summary: "神蹟、戰爭與北國亞述亡國。"),
    OutlineSection(chapterRange: "18–23 章", title: "南國關鍵時期", summary: "希西家、瑪拿西、約西亞改革。"),
    OutlineSection(chapterRange: "24–25 章", title: "被擄", summary: "西底家、聖殿被毀、百姓被擄與約雅斤末段。"),
  ],
  storyHighlights: const [
    StoryHighlight(title: "希西家禱告", description: "亞述圍城時仰望神拯救。", chapterLabel: "王下 19", chapter: 19),
    StoryHighlight(title: "約西亞發現律法書", description: "讀律法帶來撕裂衣服與改革。", chapterLabel: "王下 22", chapter: 22),
  ],
  christConnections: const [
    ChristConnection(
      otLabel: "被擄與歸回的盼望",
      ntFulfillment: "基督釋放被罪擄去的，引進新創造與新耶路撒冷。",
      verseRef: "加 4:4-5",
    ),
  ],
  applications: const [
    "讀律法與神的話時，是否願像約西亞一樣謙卑回應？",
  ],
  prayerPrompts: const [
    "主啊，在審判的敘事中仍教我仰望祢的憐憫與恢復。",
  ],
  songLinks: [SongLink(title: "相關敬拜搜尋", url: _songQ("列王紀下"))],
  quiz: const [
    QuizQuestion(
      question: "（王下 2）以利亞被接去後，誰承接先知職事，得感動他的加倍靈？",
      choices: ["以賽亞", "以利沙", "米該雅", "哈巴谷"],
      correctIndex: 1,
      feedback: "王下 2：過約旦、外衣擊水。",
    ),
    QuizQuestion(
      question: "（王下 17）北國以色列亡於哪帝國，百姓被擄？",
      choices: ["巴比倫", "埃及", "亞述", "波斯"],
      correctIndex: 2,
      feedback: "王下 17：亞述攻陷撒馬利亞。",
    ),
    QuizQuestion(
      question: "（王下 18–19）希西家面對亞述西拿基立威脅時，最終因何得拯救？",
      choices: ["向埃及買盟軍", "禱告仰望耶和華，神擊殺亞述軍", "投降", "約押出擊"],
      correctIndex: 1,
      feedback: "王下 19：神為錫安與大衛的緣故干預。",
    ),
    QuizQuestion(
      question: "（王下 22–23）約西亞王發現律法書後有何反應與行動？",
      choices: ["置之不理", "撕裂衣服、推行宗教改革除偶像", "攻打埃及", "廢祭司"],
      correctIndex: 1,
      feedback: "王下 22-23：讀律法帶來改革。",
    ),
    QuizQuestion(
      question: "（王下 25）南國猶大最後亡於何國，聖殿被毀？",
      choices: ["亞述", "巴比倫", "波斯", "希臘"],
      correctIndex: 1,
      feedback: "王下 25：尼布甲尼撒、聖殿被焚。",
    ),
  ],
  overviewVideos: const [],
  heroGradient: _gradH2,
);

final overview1Chronicles = BookOverview(
  id: "1_chronicles",
  shortName: "代上",
  fullName: "歷代志上",
  category: "歷史書",
  chapterCount: 29,
  keyTheme: "從家譜到大衛：神對歷史的掌管、敬拜秩序與大衛為建殿預備。",
  keyVerses: const [
    KeyVerse(
      reference: "代上 16:34",
      cuv: "應當稱謝耶和華，因他本為善，他的慈愛永遠長存。",
      tncv: "要稱謝耶和華，因他本是善良的，他的慈愛永遠長存。",
    ),
    KeyVerse(
      reference: "代上 29:11",
      cuv: "耶和華啊，尊大、能力、榮耀、強勝、威嚴都是你的……",
      tncv: "耶和華啊，尊大、能力、榮耀、威嚴、偉大都是你的……",
    ),
  ],
  backgroundIntro: "以家譜開場，重述掃羅至大衛的敘事，強調利未人與敬拜、大衛組織聖樂與為聖殿獻上甘心樂意的奉獻。"
      "寫作對象可能是歸回後的群體，重塑身分與盼望。",
  whyImportant: "在失敗歷史之後，重新聚焦神的信實、敬拜與那將臨的聖殿盼望。",
  keyFigures: const [
    KeyFigure(name: "大衛", oneLiner: "合神心意，為敬拜與建殿擺上。", emoji: "🎶"),
    KeyFigure(name: "利未人", oneLiner: "被分別為聖、服事會幕與歌唱。", emoji: "🎻"),
  ],
  outline: const [
    OutlineSection(chapterRange: "1–9 章", title: "家譜", summary: "從亞當到掃羅、歸回者的名單。"),
    OutlineSection(chapterRange: "10–29 章", title: "大衛生平與敬拜", summary: "作王、約櫃、獻詩、聖殿材料與奉獻。"),
  ],
  storyHighlights: const [
    StoryHighlight(title: "約櫃進大衛城", description: "歡樂敬拜與獻詩。", chapterLabel: "代上 15-16", chapter: 15),
    StoryHighlight(title: "大衛的奉獻禱告", description: "萬有屬神，甘心樂意獻上。", chapterLabel: "代上 29", chapter: 29),
  ],
  christConnections: const [
    ChristConnection(
      otLabel: "大衛的敬拜與詩篇",
      ntFulfillment: "基督是教會的頭，以心靈誠實敬拜父。",
      verseRef: "約 4:23-24",
    ),
  ],
  applications: const [
    "數算恩典，像大衛一樣甘心樂意奉獻時間與資源服事主。",
  ],
  prayerPrompts: const [
    "主啊，萬有都是祢的，願我樂意獻上所有服事祢。",
  ],
  songLinks: [SongLink(title: "相關敬拜搜尋", url: _songQ("歷代志上"))],
  quiz: const [
    QuizQuestion(
      question: "（代上 1–9）本書開篇最突出的內容是？",
      choices: ["十誡全文", "從亞當到掃羅與歸回者的家譜名單", "哀歌", "建殿藍圖"],
      correctIndex: 1,
      feedback: "代上 1-9：家譜與歸回者。",
    ),
    QuizQuestion(
      question: "（代上 10）掃羅陣亡後，敘事如何轉向？",
      choices: ["結束全書", "簡述掃羅之死，轉入大衛求王與作王", "立所羅門", "寫詩篇"],
      correctIndex: 1,
      feedback: "代上 10-11：由掃羅轉大衛。",
    ),
    QuizQuestion(
      question: "（代上 11–14）大衛在耶路撒冷鞏固王位時，有何軍事與敬拜行動？",
      choices: ["僅建殿", "攻取錫安、約櫃議題展開等", "投降非利士", "廢祭司"],
      correctIndex: 1,
      feedback: "代上 11-14：大衛作王與約櫃背景。",
    ),
    QuizQuestion(
      question: "（代上 15–16）約櫃運入大衛城時，大衛特別安排誰抬櫃並獻詩敬拜？",
      choices: ["非利士人", "利未人按神吩咐的職分", "外邦雇工", "婦女獨力"],
      correctIndex: 1,
      feedback: "代上 15-16：利未人與頌讚。",
    ),
    QuizQuestion(
      question: "（代上 28–29）書末大衛為聖殿與所羅門留下什麼，百姓如何回應？",
      choices: ["隱藏金銀", "獻藍圖、勸勉所羅門，百姓甘心為建殿奉獻", "拆毀祭壇", "與非利士聯盟"],
      correctIndex: 1,
      feedback: "代上 28-29：託付與樂意奉獻。",
    ),
  ],
  overviewVideos: const [],
  heroGradient: _gradH1,
);

final overview2Chronicles = BookOverview(
  id: "2_chronicles",
  shortName: "代下",
  fullName: "歷代志下",
  category: "歷史書",
  chapterCount: 36,
  keyTheme: "從所羅門聖殿到南國諸王：敬拜中心、悔改與神話語的提醒，至被擄與古列詔書。",
  keyVerses: const [
    KeyVerse(
      reference: "代下 7:14",
      cuv: "這稱為我名下的子民，若是自卑、禱告，尋求我的面，轉離他們的惡行……",
      tncv: "這稱為我名下的子民，若是謙卑自己，禱告，尋求我的面，轉離他們的惡行……",
    ),
    KeyVerse(
      reference: "代下 36:23",
      cuv: "波斯王古列如此說：耶和華天上的神已將天下萬國賜給我……",
      tncv: "波斯王古列如此說：耶和華天上的上帝已將地上萬國賜給我……",
    ),
  ],
  backgroundIntro: "聚焦南國猶大，強調聖殿、節期與王是否行耶和華眼中看為正的事。"
      "以古列王允許歸回作結，指向恢復與盼望。",
  whyImportant: "學習「自卑禱告轉離惡行」的應許，並在歷史終局看見神掌管列國。",
  keyFigures: const [
    KeyFigure(name: "所羅門", oneLiner: "建殿與奉獻禱告的高峰。", emoji: "🏛️"),
    KeyFigure(name: "希西家．約沙法．約西亞", oneLiner: "行正道、改革或倚靠神的王。", emoji: "✅"),
    KeyFigure(name: "古列", oneLiner: "神興起的外邦君王，下令歸回。", emoji: "📜"),
  ],
  outline: const [
    OutlineSection(chapterRange: "1–9 章", title: "所羅門與聖殿", summary: "建殿、奉獻、榮耀與警戒。"),
    OutlineSection(chapterRange: "10–28 章", title: "分裂後的猶大諸王", summary: "興衰與先知責備。"),
    OutlineSection(chapterRange: "29–36 章", title: "亡國與歸回序幕", summary: "西底家、被擄、古列詔書。"),
  ],
  storyHighlights: const [
    StoryHighlight(title: "奉獻聖殿禱告", description: "所羅門求神垂聽認罪禱告。", chapterLabel: "代下 6-7", chapter: 6),
    StoryHighlight(title: "約沙法爭戰", description: "「勝敗不在乎你們，乃在乎神」。", chapterLabel: "代下 20", chapter: 20),
  ],
  christConnections: const [
    ChristConnection(
      otLabel: "神應許垂聽悔改",
      ntFulfillment: "在基督裡得赦免，聖靈引導人認罪更新。",
      verseRef: "約壹 1:9",
    ),
  ],
  applications: const [
    "代下 7:14 作為個人與群体悔改禱告的提醒。",
  ],
  prayerPrompts: const [
    "主啊，謙卑我，使我尋求祢的面，轉離惡行。",
  ],
  songLinks: [SongLink(title: "相關敬拜搜尋", url: _songQ("歷代志下"))],
  quiz: const [
    QuizQuestion(
      question: "（代下 2–7）所羅門建殿奉獻後，神在夜間向所羅門說話，代下 7:14 強調什麼條件？",
      choices: ["獻上千萬金銀", "自卑、禱告、尋求神的面、轉離惡行", "攻打列國", "廢祭司"],
      correctIndex: 1,
      feedback: "代下 7:14：謙卑悔改的禱告。",
    ),
    QuizQuestion(
      question: "（代下 10）羅波安拒絕減負後，王國分裂，本卷敘事焦點主要轉向哪一國？",
      choices: ["北國以色列詳史", "南國猶大諸王與聖殿", "埃及", "亞述"],
      correctIndex: 1,
      feedback: "代下 10 起：聚焦猶大。",
    ),
    QuizQuestion(
      question: "（代下 20）約沙法面對大軍時，先知雅哈悉如何鼓勵？",
      choices: ["投降", "勝敗不在乎你們乃在乎神", "挖壕溝", "向埃及求救"],
      correctIndex: 1,
      feedback: "代下 20:15。",
    ),
    QuizQuestion(
      question: "（代下 34–35）約西亞發現律法書後有何作為？",
      choices: ["忽略", "撕裂衣服、推行宗教改革與守逾越節", "攻打巴比倫成功", "廢王位"],
      correctIndex: 1,
      feedback: "代下 34-35：讀律法與改革。",
    ),
    QuizQuestion(
      question: "（代下 36）本卷結尾誰下詔允許猶大人歸回耶路撒冷建殿？",
      choices: ["尼布甲尼撒", "亞達薛西", "波斯王古列", "大衛"],
      correctIndex: 2,
      feedback: "代下 36:22-23：古列詔書。",
    ),
  ],
  overviewVideos: const [],
  heroGradient: _gradH2,
);

final _ezra = BookOverview(
  id: "ezra",
  shortName: "拉",
  fullName: "以斯拉記",
  category: "歷史書",
  chapterCount: 10,
  keyTheme: "歸回、重建聖殿與以斯拉帶領百姓認罪立約，恢復以律法為中心的生活。",
  keyVerses: const [
    KeyVerse(
      reference: "拉 7:10",
      cuv: "以斯拉定志考究遵行耶和華的律法，又將律例典章教訓以色列人。",
      tncv: "以斯拉專心研究遵行耶和華的律法，並將律例典章教導以色列人。",
    ),
    KeyVerse(
      reference: "拉 3:11",
      cuv: "他們彼此唱和，讚美稱謝耶和華說：他本為善，他向以色列人永發慈愛。",
      tncv: "他們應聲讚美耶和華說：他本是善良的，他向以色列人永遠施慈愛。",
    ),
  ],
  backgroundIntro: "接續歷代志下古列詔書，所羅巴伯等人歸回建殿、受阻再興工；以斯拉率第二批歸回，"
      "面對通婚等罪，帶領認罪。",
  whyImportant: "示範恢復不只是地理回家，更是心歸向神的話與聖潔。",
  keyFigures: const [
    KeyFigure(name: "所羅巴伯", oneLiner: "帶領首批歸回建殿的領袖。", emoji: "🏗️"),
    KeyFigure(name: "以斯拉", oneLiner: "文士祭司，專心教導律法。", emoji: "📜"),
    KeyFigure(name: "哈該．撒迦利亞", oneLiner: "先知鼓勵完成建殿（同時期，見先知書）。", emoji: "📣"),
  ],
  outline: const [
    OutlineSection(chapterRange: "1–6 章", title: "建殿", summary: "古列詔書、歸回、根基與阻力、大流士時完工。"),
    OutlineSection(chapterRange: "7–10 章", title: "以斯拉改革", summary: "以斯拉歸回、認罪、對付異族通婚。"),
  ],
  storyHighlights: const [
    StoryHighlight(title: "立殿根基時的哭號與歡呼", description: "老見過舊殿者哭、眾人大聲歡呼。", chapterLabel: "拉 3", chapter: 3),
    StoryHighlight(title: "以斯拉撕裂外袍", description: "為百姓的罪痛心禱告。", chapterLabel: "拉 9", chapter: 9),
  ],
  christConnections: const [
    ChristConnection(
      otLabel: "潔淨的群體",
      ntFulfillment: "教會是聖潔新婦，在基督裡分別為聖。",
      verseRef: "弗 5:25-27",
    ),
  ],
  applications: const [
    "定志考究遵行神的話，並樂意教導他人。",
  ],
  prayerPrompts: const [
    "主啊，求祢使我為罪憂傷，卻不靠行為稱義，只靠基督。",
  ],
  songLinks: [SongLink(title: "相關敬拜搜尋", url: _songQ("以斯拉記"))],
  quiz: const [
    QuizQuestion(
      question: "（拉 1）波斯王古列下詔的核心內容是？",
      choices: ["禁止敬拜", "允許猶大人歸回耶路撒冷重建耶和華殿", "徵兵攻打希臘", "廢祭司職分"],
      correctIndex: 1,
      feedback: "拉 1：古列詔書。",
    ),
    QuizQuestion(
      question: "（拉 3）所羅巴伯等立聖殿根基時，會眾為何又哭又喊？",
      choices: ["工價爭議", "見過舊殿者因對比痛哭，同時有人大聲歡呼", "地震", "被擄巴比倫"],
      correctIndex: 1,
      feedback: "拉 3:12-13：哭號與歡呼交雜。",
    ),
    QuizQuestion(
      question: "（拉 4）建殿工程受阻，主要因為什麼？",
      choices: ["沒有木料", "鄰省上本攔阻，工程被迫停工一段時日", "大衛反對", "非利士全滅"],
      correctIndex: 1,
      feedback: "拉 4：攔阻與停工。",
    ),
    QuizQuestion(
      question: "（拉 6）誰查案後下令恢復建殿，工程得以完成？",
      choices: ["古列", "大流士王依先王詔命核准", "亞哈隨魯", "法老"],
      correctIndex: 1,
      feedback: "拉 6：大流士詔。",
    ),
    QuizQuestion(
      question: "（拉 7–10）以斯拉到後，為百姓何種罪撕裂衣袍、認罪禱告？",
      choices: ["不納稅", "與外邦通婚等背道", "拒守安息日", "拆毀祭壇"],
      correctIndex: 1,
      feedback: "拉 9-10：對付異族通婚。",
    ),
  ],
  overviewVideos: const [],
  heroGradient: _gradH1,
);

final _nehemiah = BookOverview(
  id: "nehemiah",
  shortName: "尼",
  fullName: "尼希米記",
  category: "歷史書",
  chapterCount: 13,
  keyTheme: "尼希米為耶路撒冷與百姓痛心禱告，重建城牆並與以斯拉帶領百姓遵行律法。",
  keyVerses: const [
    KeyVerse(
      reference: "尼 8:10",
      cuv: "因靠耶和華而得的喜樂是你們的力量。",
      tncv: "因為靠耶和華而得到的喜樂是你們的力量。",
    ),
    KeyVerse(
      reference: "尼 1:11",
      cuv: "主啊，求你側耳聽你僕人的禱告……",
      tncv: "主啊，求你側耳聽你僕人的禱告……",
    ),
  ],
  backgroundIntro: "尼希米在書珊聽見耶路撒冷荒涼而禁食禱告，蒙王差遣回猶大，"
      "克服攔阻完成城牆，再與以斯拉宣讀律法、認罪立約。",
  whyImportant: "結合禱告、行動與神的話，示範領袖的負擔與群體更新。",
  keyFigures: const [
    KeyFigure(name: "尼希米", oneLiner: "酒政變省长，禱告與行政並重的領袖。", emoji: "🧱"),
    KeyFigure(name: "以斯拉", oneLiner: "宣讀律法，帶領百姓明白而哭泣。", emoji: "📖"),
    KeyFigure(name: "多比雅．參巴拉", oneLiner: "阻擋重建的對手。", emoji: "🚧"),
  ],
  outline: const [
    OutlineSection(chapterRange: "1–7 章", title: "禱告與建牆", summary: "負擔、考察、分段建造、克服毀謗。"),
    OutlineSection(chapterRange: "8–13 章", title: "宣讀律法與更新", summary: "住棚節、認罪、立約、尼希米再改革。"),
  ],
  storyHighlights: const [
    StoryHighlight(title: "夜間考察城牆", description: "尼希米默默了解實況再行動。", chapterLabel: "尼 2", chapter: 2),
    StoryHighlight(title: "宣讀律法的大會", description: "百姓聽見律法而哭泣，被勸靠主喜樂。", chapterLabel: "尼 8", chapter: 8),
  ],
  christConnections: const [
    ChristConnection(
      otLabel: "重建與保護",
      ntFulfillment: "基督建造教會，陰間的門不能勝過。",
      verseRef: "太 16:18",
    ),
  ],
  applications: const [
    "為神的國與城市禱告，並付諸具體、勇敢的行動。",
  ],
  prayerPrompts: const [
    "主啊，求祢興起對祢百姓與教會的負擔，使我忠心服事。",
  ],
  songLinks: [SongLink(title: "相關敬拜搜尋", url: _songQ("尼希米記"))],
  quiz: const [
    QuizQuestion(
      question: "（尼 1）尼希米聽見耶路撒冷城牆荒涼後，首先做什麼？",
      choices: ["立刻出發", "禁食禱告在神面前認罪懇求", "向王爭吵", "寫哀歌"],
      correctIndex: 1,
      feedback: "尼 1：禱告。",
    ),
    QuizQuestion(
      question: "（尼 2）尼希米得王允准回猶大前，夜裡先做什麼？",
      choices: ["宴請敵人", "暗中考察耶路撒冷城牆破口", "建聖殿", "立王"],
      correctIndex: 1,
      feedback: "尼 2:11-15：夜間騎行察看。",
    ),
    QuizQuestion(
      question: "（尼 3–6）修牆時，參巴拉等人如何攔阻？",
      choices: ["幫助運石", "毀謗、恐嚇、設計害尼希米", "獻金銀", "離開猶大"],
      correctIndex: 1,
      feedback: "尼 4-6：毀謗與謀害。",
    ),
    QuizQuestion(
      question: "（尼 8）以斯拉宣讀律法時，尼 8:10 勸百姓靠什麼得力？",
      choices: ["靠耶和華而得的喜樂", "靠糧食儲備", "靠刀劍", "靠沉默"],
      correctIndex: 0,
      feedback: "尼 8:10：靠主喜樂為力量。",
    ),
    QuizQuestion(
      question: "（尼 9–10）宣讀律法後，百姓有何群体行動？",
      choices: ["攻打波斯", "認罪、立約遵守神的律例", "廢祭司", "回巴比倫"],
      correctIndex: 1,
      feedback: "尼 9-10：認罪立約。",
    ),
  ],
  overviewVideos: const [],
  heroGradient: _gradH2,
);

final _esther = BookOverview(
  id: "esther",
  shortName: "斯",
  fullName: "以斯帖記",
  category: "歷史書",
  chapterCount: 10,
  keyTheme: "神的名雖未直接出現，卻在宮廷陰謀中保守子民；以斯帖與末底改冒死為本族請命。",
  keyVerses: const [
    KeyVerse(
      reference: "斯 4:14",
      cuv: "焉知你得了王后的位分不是為現今的機會嗎？",
      tncv: "誰知道你是否得了王后的位分，正是為了現今的機會呢？",
    ),
    KeyVerse(
      reference: "斯 9:22",
      cuv: "猶大人脫離仇敵得平安……轉憂為喜。",
      tncv: "猶大人脫離仇敵的手，從悲愁轉為喜樂。",
    ),
  ],
  backgroundIntro: "波斯王亞哈隨魯時期，哈曼陰謀滅族，以斯帖在末底改鼓勵下冒死覲見，"
      "局勢逆轉，訂立普珥日紀念。本書獨特之處是未提「耶和華」之名。",
  whyImportant: "學習在隱藏的神手中辨認護理，並在關鍵時刻為公義挺身而出。",
  keyFigures: const [
    KeyFigure(name: "以斯帖", oneLiner: "被揀選為后，為救本族冒死見王。", emoji: "👸"),
    KeyFigure(name: "末底改", oneLiner: "養父與警醒者，不肯跪拜哈曼。", emoji: "🧥"),
    KeyFigure(name: "哈曼", oneLiner: "陰謀滅族的惡人。", emoji: "⚫"),
  ],
  outline: const [
    OutlineSection(chapterRange: "1–2 章", title: "選后", summary: "廢后、選美、以斯帖被立。"),
    OutlineSection(chapterRange: "3–7 章", title: "危機升高", summary: "哈曼陰謀、禁食、以斯帖設宴、哈曼敗露。"),
    OutlineSection(chapterRange: "8–10 章", title: "逆轉與紀念", summary: "諭旨、猶人自衛、普珥日。"),
  ],
  storyHighlights: const [
    StoryHighlight(title: "「若死就死吧」", description: "以斯帖決志覲見王。", chapterLabel: "斯 4", chapter: 4),
    StoryHighlight(title: "哈曼掛在自己木架上", description: "惡人計謀反害己身。", chapterLabel: "斯 7", chapter: 7),
  ],
  christConnections: const [
    ChristConnection(
      otLabel: "隱藏的神與拯救",
      ntFulfillment: "神在基督裡成就終極拯救，萬事互相效力。",
      verseRef: "羅 8:28",
    ),
  ],
  applications: const [
    "辨認神放在你「現今機會」中的角色與責任。",
  ],
  prayerPrompts: const [
    "主啊，即使環境看不見祢的名，仍教我信靠祢的護理。",
  ],
  songLinks: [SongLink(title: "相關敬拜搜尋", url: _songQ("以斯帖記"))],
  quiz: const [
    QuizQuestion(
      question: "（斯 1–2）以斯帖如何成為波斯王后？",
      choices: ["征戰得勝", "被引入宮入選，蒙王抬舉冊立為后", "繼承王位", "祭司推舉"],
      correctIndex: 1,
      feedback: "斯 2：選后與以斯帖蒙恩。",
    ),
    QuizQuestion(
      question: "（斯 3）末底改不肯向誰跪拜，引發滅族陰謀？",
      choices: ["亞哈隨魯王", "哈曼", "以斯帖", "太监長"],
      correctIndex: 1,
      feedback: "斯 3：哈曼惱怒末底改。",
    ),
    QuizQuestion(
      question: "（斯 4）以斯帖決定冒死覲見王前，末底改說「焉知你得了王后位分不是為現今的機會嗎」主要在強調？",
      choices: ["逃離波斯", "神可能藉她的位分拯救猶大人", "廢哈曼為王", "停止禁食"],
      correctIndex: 1,
      feedback: "斯 4:14：現今的機會與責任。",
    ),
    QuizQuestion(
      question: "（斯 7）哈曼為末底改預備的木架最後誰被掛其上？",
      choices: ["末底改", "哈曼自己", "王", "以斯帖"],
      correctIndex: 1,
      feedback: "斯 7:10：惡人反害己身。",
    ),
    QuizQuestion(
      question: "（斯 9）猶大人反擊脫險後，訂立何節期紀念？",
      choices: ["逾越節", "普珥日", "住棚節", "五旬節"],
      correctIndex: 1,
      feedback: "斯 9:26-28：普珥日。",
    ),
  ],
  overviewVideos: const [],
  heroGradient: [const Color(0xFF4A148C), const Color(0xFF7B1FA2), const Color(0xFFCE93D8)],
);
