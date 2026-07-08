$path = 'c:\Users\mark6\.gemini\antigravity\scratch\japan-trip-sep-2026\index.html'
$content = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)

$startMarker = 'date: "2026-10-02",'
$endMarker = 'date: "2026-10-03",'

$startIdx = $content.IndexOf($startMarker)
if ($startIdx -eq -1) {
    Write-Host "Error: 2026-10-02 not found"
    exit 1
}

# Backtrack to the opening '{' of the Day 7 block
$blockStart = $content.LastIndexOf('{', $startIdx)
if ($blockStart -eq -1) {
    Write-Host "Error: Opening bracket for Day 7 not found"
    exit 1
}

$endIdx = $content.IndexOf($endMarker, $startIdx)
if ($endIdx -eq -1) {
    Write-Host "Error: 2026-10-03 not found"
    exit 1
}

# Find the closing '},' of the Day 7 block
$blockEnd = $content.LastIndexOf('},', $endIdx)
if ($blockEnd -eq -1) {
    Write-Host "Error: Closing bracket for Day 7 not found"
    exit 1
}
# Include the '},' in the block to replace
$blockEnd = $blockEnd + 2

$oldBlock = $content.Substring($blockStart, $blockEnd - $blockStart)

$newBlock = @"
{
            date: "2026-10-02",
            title: "福岡地標海景、神級麵包與明太子大餐",
            tag: "休閒",
            weather: "⛅ 25°C",
            events: [
                {
                    time: "09:30", type: "food", icon: "fas fa-coffee",
                    title: "早餐早茶：stock 天神店 (Pain stock) ☕",
                    desc: "早上全家睡到自然醒，散步前往水上公園大樓的 stock。這時段麵包剛出爐、種類最齊全。在極極具設計感的冷氣店內享用優雅的早茶，拍照好看，長輩精神也剛好喚醒。",
                    badges: [{cls:"food", icon:"fa-star", text:"神級明太子法國麵包"}],
                    tip: { title: "招牌必點 🥖", content: "強烈推薦招牌現烤「明太子法國麵包」與其他精緻歐式麵包，配上高水準的現沖咖啡，內用非常享受！" }
                },
                {
                    time: "10:30", type: "buy", icon: "fas fa-shopping-bag",
                    title: "天神地下街 ── 歐風輕鬆逛街避暑 🛍️",
                    desc: "走出麵包店，直接順著平路走 5 分鐘滑進天神地下街的東側入口。此時正是外面太陽開始變大、變熱的時候，我們剛好「與世隔絕」躲在冷氣極涼的地下街購物。",
                    badges: [{cls:"buy", icon:"fa-shopping-bag", text:"零階梯無障礙"}],
                    tip: { title: "散步體驗 🚶‍♂️", content: "整條地下街約 600 公尺完全平坦、零階梯，大家可以兩手空空、開啟純散步放鬆模式。長輩想買的貼布或保健食品可直接在這裡的連鎖大藥妝店搞定。" }
                },
                {
                    time: "11:20", type: "food", icon: "fas fa-utensils",
                    title: "午餐重頭戲：元祖博多明太重 (元祖博多めんたい重) 🍱",
                    desc: "在地下街逛到 11:20 左右，從靠近天神中央公園的出口走上地面，步行 5 分鐘即可抵達明太重。這個時間點剛好趕在第一波午餐大洪流（11:45~13:00）爆滿前卡進排隊前端！",
                    badges: [{cls:"food", icon:"fa-star", text:"博多明太子名店"}],
                    tip: { title: "用餐環境 🥢", content: "進店後，長輩可以舒舒服服坐進充滿高級日式料亭感的空間，大口享用極致奢華的明太子便當與沾麵，滿足感絕對爆棚。" }
                },
                {
                    time: "13:10", type: "transport", icon: "fas fa-taxi",
                    title: "天神 ➔ 福岡塔 (搭計程車都市高速海景) 🚕",
                    desc: "吃飽約一點十分，正是一天之中最暴曬的時候。我們完全不在大太陽下走路，直接在店門口或隔壁天神中央公園叫 2 台計程車（使用 Uber 或 GO App）。",
                    notice: { icon: "fa-taxi", text: "計程車優勢 🌊", warning: "司機會直接走「福岡都市高速道路」（快速道路），只要 15 分鐘、一邊吹冷氣一邊從車窗俯瞰大片博多灣海景，就直達福岡塔正門口，舒適又省力。" }
                },
                {
                    time: "13:25", type: "sight", icon: "fas fa-city",
                    title: "福岡塔 ➔ 百道海濱公園 🗼",
                    desc: "抵達後搭乘全透明電梯登上 123 公尺高的展望台，360 度俯瞰整個市景與百道海濱的異國風情。接著一樓走出來就是百道海濱公園，可以看看沙灘上的歐風婚禮教堂。",
                    badges: [{cls:"sight", icon:"fa-binoculars", text:"全景看海"}],
                    tip: { title: "長輩防累建議 🏖️", content: "1. 福岡塔高空冷氣極涼、視野開闊，現場有很多舒服的長椅，長輩累了隨時可以坐著看海。<br>2. 海邊公園鋪有非常平坦寬敞的木棧道，海風吹來很舒服，牽著長輩散步 15-20 分鐘，可以拍出最頂級的家族大合照。" }
                },
                {
                    time: "15:00", type: "transport", icon: "fas fa-taxi",
                    title: "福岡塔 ➔ 福岡飯店 (計程車回程)",
                    desc: "在福岡塔下再次叫 2 台計程車，直接拉回福岡飯店。三點半前讓長輩躺平、吹冷氣大睡一個多小時，把體力條完全補滿。"
                },
                {
                    time: "18:00", type: "food", icon: "fas fa-utensils",
                    title: "晚餐：博多純情拉麵 ShinShin 🍜",
                    desc: "晚上長輩電力充满，帶去吃湯頭清爽、接受度 100% 的 ShinShin 拉麵。全家圍桌加點一口餃子、炒拉麵、配杯冰啤酒，幫完美、精緻又完全不累的一天乾杯！",
                    badges: [{cls:"food", icon:"fa-star", text:"人氣豚骨拉麵"}],
                    tip: { title: "排隊提示 💡", content: "ShinShin 拉麵各分店（如天神本店或博多站店）在晚餐時段通常會有排隊人潮，但隊伍前進速度相當快，通常等待 20-30 分鐘即可入座。" }
                }
            ]
        },
"@

# Normalize line endings
$newBlock = $newBlock.Replace("`r`n", "`n").Replace("`n", "`r`n")

# Clean typo "極極具" -> "極具" in the new block
$newBlock = $newBlock.Replace("極極具", "極具")

$content = $content.Replace($oldBlock, $newBlock)

# Replace the transport mileage description
$t7Trans = '<li><strong>Day 7-8：</strong>福岡市區（不開車，使用地下鐵一日券 / 步行逛天神博多）</li>'
$r7Trans = '<li><strong>Day 7-8：</strong>福岡市區（不開車，搭配地下鐵/計程車舒適移動，宿福岡）</li>'
$content = $content.Replace($t7Trans, $r7Trans)

[System.IO.File]::WriteAllText($path, $content, [System.Text.Encoding]::UTF8)
Write-Host "Success: Day 7 optimized and updated."
