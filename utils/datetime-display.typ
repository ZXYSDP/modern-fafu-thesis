// 显示中文日期
#let datetime-display(date) = {
  date.display("[year] 年 [month] 月 [day] 日")
}

// 显示英文日期
#let datetime-en-display(date) = {
  date.display("[month repr:short] [day], [year]")
}
#let daxie=(
  "1":"一",
  "2":"二",
  "3":"三",
  "4":"四",
  "5":"五",
  "6":"六",
  "7":"七",
  "8":"八",
  "9":"九",
  "0":"〇",
)
#let get-data2=datetime-display(datetime.today()).split(regex("[0-9]{0}"))
#let time-cn() ={
daxie.at(get-data2.at(1))
daxie.at(get-data2.at(2))
daxie.at(get-data2.at(3))
daxie.at(get-data2.at(4))
get-data2.at(6)
if daxie.at(get-data2.at(8)) == "〇" {
  daxie.at(get-data2.at(9))
} else if daxie.at(get-data2.at(8))=="一" and daxie.at(get-data2.at(9))=="〇"{
  "十"
}else if daxie.at(get-data2.at(8))=="一" and daxie.at(get-data2.at(9))!="〇"{
  "十"
  daxie.at(get-data2.at(9))
} else {
  daxie.at(get-data2.at(8))
  daxie.at(get-data2.at(9))
}
get-data2.at(11)
}