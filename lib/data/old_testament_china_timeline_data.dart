import "../models/ot_china_timeline_entry.dart";
import "old_testament_sections_data.dart";

/// 摩西五經書卷 id → 顯示名（向後相容；新程式請用 [timelineLabelForBookId]）。
const Map<String, String> torahBookLabelsForTimeline = {
  "genesis": "創世記",
  "exodus": "出埃及記",
  "leviticus": "利未記",
  "numbers": "民數記",
  "deuteronomy": "申命記",
};

/// 依**傳統成書年代通說**（compositional order, traditional dating）排列的書卷 id（舊約時間線選書用）。
///
/// 約略對應：摩西五經（主前1450–1400）→ 撒母耳記史傳（書、士、撒上）→ 大衛詩篇 → 所羅門箴言／傳道書／雅歌
/// → 約伯記（成書年代爭議，暫置於所羅門智慧書之後）→ 王國期史書編修（撒下、王上、王下）→ 何西阿、阿摩司、彌迦
/// → 以賽亞 → 那鴻、哈巴谷、西番雅 → 路得（主前586前）→ 耶利米與哀歌 → 以西結 → 但以理 → 哈該、撒迦利亞
/// → 瑪拉基 → 歷代志／以斯拉／尼希米（編年史家）→ 以斯帖（波斯時期，通說補列於歸回敘事之後）
/// → 約珥、俄巴底亞、約拿（主前400年前，年代爭議大）。
///
/// 各卷實際寫作與編修學界仍有爭議；此順序僅便於時間線學習，非教義定論。
const List<String> otBookIdsCompositionOrder = [
  // ~1450–1400 BCE：摩西
  "genesis",
  "exodus",
  "leviticus",
  "numbers",
  "deuteronomy",
  // ~1100–1000 BCE：撒母耳等（書、士、撒上）
  "joshua",
  "judges",
  "1_samuel",
  // ~960 BCE：大衛
  "psalms",
  // ~920 BCE：所羅門
  "proverbs",
  "ecclesiastes",
  "song_of_songs",
  // 約伯記：傳統作者與成書年代眾說紛紜，置於所羅門智慧書之後、王國史書編修期之前
  "job",
  // ~950–650 BCE：申命記史學等（撒下、王上、王下）
  "2_samuel",
  "1_kings",
  "2_kings",
  // ~750–722 BCE
  "hosea",
  "amos",
  "micah",
  // ~740–686 BCE
  "isaiah",
  // ~625–586 BCE
  "nahum",
  "habakkuk",
  "zephaniah",
  // Before 586 BCE
  "ruth",
  // ~586 BCE：耶利米
  "jeremiah",
  "lamentations",
  // ~571 / ~550 / ~520 BCE
  "ezekiel",
  "daniel",
  "haggai",
  "zechariah",
  // ~450–400 BCE
  "malachi",
  // ~435–425 BCE：編年史家
  "1_chronicles",
  "2_chronicles",
  "ezra",
  "nehemiah",
  // 以斯帖：波斯時期敘事，通說成書於被擄歸回背景下，列於編年史家敘事之後
  "esther",
  // Before 400 BCE（年代不確定）
  "joel",
  "obadiah",
  "jonah",
];

/// 舊約時間線選書順序（同 [otBookIdsCompositionOrder]）。
List<String> get otBookIdsForTimeline => otBookIdsCompositionOrder;

/// 書卷 id → 全名（與 [BookOverview.id] 一致）。
String timelineLabelForBookId(String id) {
  for (final s in oldTestamentSections) {
    for (final b in s.books) {
      if (b.id == id) return b.fullName;
    }
  }
  return torahBookLabelsForTimeline[id] ?? id;
}

/// 舊約時間序 × 中國歷史平行對照。
/// 聖經考古與中國斷代各有學說，條目以常見敘事／通史教材為參考，標「約」表示不精確。
/// [relatedBookIds] 列出與該時代敘事最相關的書卷（一書可出現在多個時段）。
const List<OtChinaTimelineEntry> oldTestamentChinaTimeline = [
  OtChinaTimelineEntry(
    approxDateLabel: "約主前 2100 年以前",
    otTitle: "創世記早期（先祖與洪水）",
    otDetail: "從創造到挪亞、巴別塔等敘事；人類早期與神的關係。",
    chinaTitle: "古史傳說與部落時代",
    chinaDetail: "三皇五帝傳說、部落聯盟與早期農耕聚落（考古與文獻尚在整合）。",
    relatedBookIds: ["genesis"],
    note: "兩邊年代皆為概略，不宜作嚴格年代對點。",
  ),
  OtChinaTimelineEntry(
    approxDateLabel: "約主前 2000–1800 年",
    otTitle: "亞伯拉罕、以撒、雅各",
    otDetail: "蒙召、應許之約、以掃與雅各等先祖故事。",
    chinaTitle: "夏朝晚期至商朝早期",
    chinaDetail: "傳統斷代中夏商之交；二里頭等考古文化與「夏」是否對應仍為學界討論重點。",
    relatedBookIds: ["genesis"],
  ),
  OtChinaTimelineEntry(
    approxDateLabel: "約主前 1800–1500 年",
    otTitle: "約瑟在埃及",
    otDetail: "雅各一家下埃及、以色列人寄居與繁衍。",
    chinaTitle: "商朝早中期",
    chinaDetail: "商王朝鞏固、青銅與甲骨文化發展。",
    relatedBookIds: ["genesis"],
  ),
  OtChinaTimelineEntry(
    approxDateLabel: "約主前 1500–1200 年",
    otTitle: "摩西、出埃及、西奈之約",
    otDetail: "十災、逾越節、過紅海、律法與會幕（出埃及記年代學說多種）。",
    chinaTitle: "商朝中晚期",
    chinaDetail: "商王都遷徙（如盤庚）、甲骨文成熟、青銅文明鼎盛。",
    relatedBookIds: ["exodus", "leviticus", "numbers", "deuteronomy"],
    note: "出埃及「主前十三世紀」為常見說法之一，亦有更早／更晚主張。",
  ),
  OtChinaTimelineEntry(
    approxDateLabel: "約主前 1200–1050 年",
    otTitle: "進迦南、士師時代",
    otDetail: "約書亞記、士師記、路得記：征服迦南與「沒有王」的循環敘事；申命記／民數記末尾預備進入應許地。",
    chinaTitle: "商末至西周初年",
    chinaDetail: "商紂與周武王伐紂（牧野）、周朝建立與封建。",
    relatedBookIds: ["numbers", "deuteronomy", "joshua", "judges", "ruth"],
  ),
  OtChinaTimelineEntry(
    approxDateLabel: "約主前 1050–930 年",
    otTitle: "王國統一時期",
    otDetail:
        "掃羅、大衛、所羅門；撒母耳記上下、列王紀上、歷代志上末至歷代志下開篇、聖殿與智慧傳統（詩篇、箴言、傳道書、雅歌多歸此期或所羅門相關傳統）。",
    chinaTitle: "西周",
    chinaDetail: "成康之治等；宗法、禮樂與「天命」觀念發展。",
    relatedBookIds: [
      "1_samuel",
      "2_samuel",
      "1_kings",
      "2_kings",
      "1_chronicles",
      "2_chronicles",
      "psalms",
      "proverbs",
      "ecclesiastes",
      "song_of_songs",
    ],
  ),
  OtChinaTimelineEntry(
    approxDateLabel: "約主前 930–722 年",
    otTitle: "分裂王國（南北國並立）",
    otDetail:
        "列王紀上下、歷代志下：南北對峙；北國先知如何西阿、阿摩司、約拿、俄巴底亞、約珥（寫作年代學說不一）、南國以賽亞早期、彌迦、那鴻、哈巴谷、西番雅等事工背景。",
    chinaTitle: "西周末至春秋時期",
    chinaDetail: "周室東遷（平王東遷）、諸侯爭霸開始。",
    relatedBookIds: [
      "1_kings",
      "2_kings",
      "1_chronicles",
      "2_chronicles",
      "isaiah",
      "hosea",
      "joel",
      "amos",
      "obadiah",
      "jonah",
      "micah",
      "nahum",
      "habakkuk",
      "zephaniah",
      "psalms",
    ],
  ),
  OtChinaTimelineEntry(
    approxDateLabel: "約主前 722–586 年",
    otTitle: "南國猶大至被擄巴比倫",
    otDetail:
        "北國亡於亞述；南國至尼布甲尼撒攻陷耶路撒冷；以賽亞後期、耶利米、耶利米哀歌、以西結、但以理早年、哈巴谷、西番雅、那鴻、部分詩篇與約伯記等智慧反省（成書年代眾說）。",
    chinaTitle: "春秋中晚期",
    chinaDetail: "霸主政治、禮崩樂壞；孔子生活於此一大變動時代（春秋末期）。",
    relatedBookIds: [
      "2_kings",
      "2_chronicles",
      "isaiah",
      "jeremiah",
      "lamentations",
      "ezekiel",
      "daniel",
      "habakkuk",
      "zephaniah",
      "micah",
      "nahum",
      "joel",
      "obadiah",
      "psalms",
      "job",
    ],
  ),
  OtChinaTimelineEntry(
    approxDateLabel: "約主前 586–539 年",
    otTitle: "巴比倫被擄期",
    otDetail: "聖殿被毀、猶大精英被擄；以西結、但以理書敘事與預言；耶利米書末事、列王紀下結尾；哀歌與部分詩篇背景。",
    chinaTitle: "春秋晚期",
    chinaDetail: "吳越爭霸、大夫專權；向戰國過渡。",
    relatedBookIds: [
      "2_kings",
      "2_chronicles",
      "jeremiah",
      "lamentations",
      "ezekiel",
      "daniel",
      "psalms",
      "job",
    ],
  ),
  OtChinaTimelineEntry(
    approxDateLabel: "約主前 539–332 年",
    otTitle: "波斯時期與歸回",
    otDetail:
        "古列詔令、以斯拉記、尼希米記、以斯帖記、哈該書、撒迦利亞書（主體）、但以理書後半預言背景；歷代志下以古列詔結束。約珥書亦有學者置於被擄後。",
    chinaTitle: "戰國時代",
    chinaDetail: "列國變法、兼併戰爭；百家爭鳴。",
    relatedBookIds: [
      "ezra",
      "nehemiah",
      "esther",
      "daniel",
      "haggai",
      "zechariah",
      "2_chronicles",
      "psalms",
      "joel",
    ],
  ),
  OtChinaTimelineEntry(
    approxDateLabel: "約主前 400 年前後",
    otTitle: "被擄歸回後的先知與聖殿群體",
    otDetail: "瑪拉基書等：等候彌賽亞與神公義彰顯；舊約希伯來文正典敘事臨近尾聲。",
    chinaTitle: "戰國中晚期",
    chinaDetail: "秦國崛起、遠交近攻；為日後統一鋪路。",
    relatedBookIds: ["malachi", "ezra", "nehemiah", "zechariah", "psalms"],
  ),
];

/// 與指定書卷（[bookId] 同 [BookOverview.id]）相關的對照條目，依原表順序。
List<OtChinaTimelineEntry> timelineEntriesForBook(String bookId) {
  return oldTestamentChinaTimeline
      .where((e) => e.relatedBookIds.contains(bookId))
      .toList(growable: false);
}

/// 與 [bookIds] 中任一所選書卷相關的對照條目，依 [oldTestamentChinaTimeline] 原順序；
/// 同一時段條目只出現一次。
List<OtChinaTimelineEntry> timelineEntriesForBooks(Set<String> bookIds) {
  if (bookIds.isEmpty) return const [];
  return oldTestamentChinaTimeline
      .where((e) => e.relatedBookIds.any(bookIds.contains))
      .toList(growable: false);
}

const String oldTestamentChinaTimelineDisclaimer =
    "本表為「敘事時代」與中國歷史分期的大略對照，非精確紀年對點。"
    "聖經考古、埃及／近東年表與夏商周斷代皆有多種學說，請以教學與靈修參考為主。"
    "請選擇下方書卷（可多選），畫面會合併顯示與所選各卷敘事相關的時代；同一時段只出現一次；智慧書與部分先知書成書年代學說不一，可能跨越多個時段。"
    "下方書卷按「傳統成書年代」通說排序（與作者在世及寫作時期之粗略對應），學界對各卷仍多有討論；順序與聖經正典卷冊編排不同。"
    "約伯記、以斯帖記之定位為表列延伸；約珥、俄巴底亞、約拿之年代尤具不確定性。";
