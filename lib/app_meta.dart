/// 與 [pubspec.yaml] 的 `version` 對齊（顯示用，不含 build number）。
const String kAppVersionLabel = "1.0.0";

/// 意見回報收件信箱（畫面不顯示此位址，僅用於 `mailto:`）。若留空則使用無收件人之 `mailto:?subject=…`。
const String kAppFeedbackEmail = "tamball@hotmail.com";

/// 經文版權說明（本 App 使用 RCUV 資產，見 [BibleRepository]）。
const String kBibleCopyrightNotice =
    "聖經經文採用《和合本修訂版》（RCUV）。版權屬香港聖經公會及聯合聖經公會等經文版權持有人；"
    "本應用僅作個人研讀與教學參考，請勿擅自大量複製或商用發行經文內容。";

// --- Credits（致謝）：以下可視需要修改；留空的欄位在畫面上會略過 ---

/// 應用程式製作／策劃署名（例：某某團契、姓名）。留空則不顯示「製作」一節。
const String kAppCreditAuthor = "譚紹球牧師\n新利旺浸信會";

/// 選填：製作單位或專案介紹頁之 `https://` 網址；與 [kAppCreditAuthor] 一併顯示。
const String kAppCreditAuthorUrl = "https://www.sdbc.org.au";

/// 概覽影片、播放清單等外部內容之致謝與免責說明。
const String kAppCreditVideoAttribution =
    "書卷概覽與舊約導論等影片連結，來自 YouTube《讀聖經》頻道所公開之教學內容（頻道於 YouTube 上之全名與網址以該平台顯示為準；"
    "本 App 所連結之《讀聖經：舊約》等播放清單亦屬該頻道公開資源）。"
    "各影片之著作權歸原上傳者、《讀聖經》頻道及相關版權持有人所有；本 App 僅提供連結以便個人學習參考，"
    "不託管、不重製影片內容，亦不宣稱經特別授權轉載。";

/// 選填：書卷概覽文案、時間線對照表、測驗題等資料之編輯或參考來源說明。
const String kAppCreditDataAttribution =
    "本 App 內之書卷概覽摘要、舊約與中國歷史對照表、測驗題等文字資料，為策劃者整理編寫，"
    "僅供新利旺浸信會內部教學與靈修參考之用；未經書面同意，不得對外商用散佈、完整轉載或改作發行。"
    "聖經經文仍以版權持有人授權之譯本為準。";

/// 技術與第三方套件之簡短說明。
const String kAppCreditTechAttribution =
    "本 App 以 Flutter 建置；所使用套件之授權條款見建置產物內之 NOTICES（依平台而異）。";
