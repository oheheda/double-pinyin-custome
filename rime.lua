function datetime_translator(input, seg)
    if (input == "date") then
        --- Candidate(type, start, end, text, comment)
        local cand = Candidate("date", seg.start, seg._end, os.date("%Y年%m月%d日"), " ")
        cand.quality = 1
        yield(cand)
        cand = Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d"), " ")
        cand.quality = 1
        yield(cand)
    elseif (input == "time") then -- 关键字更改，你也可以用or语句定义多个关键字
        yield(Candidate("time", seg.start, seg._end, os.date("%H:%M:%S"), " "))
        yield(Candidate("time", seg.start, seg._end, os.date("%H点%M分%S秒"), " "))
        yield(Candidate("time", seg.start, seg._end, os.date("%H:%M"), " "))
        yield(Candidate("time", seg.start, seg._end, os.date("%H点%M分"), " "))
    elseif (input == "datetime") then
        -- yield(Candidate("time", seg.start, seg._end, os.date(), " "))
        yield(Candidate("date", seg.start, seg._end, os.date("%Y年%m月%d日 %H时%M分%S秒"), " "))
        yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d %H:%M:%S"), " "))
        -- yield(Candidate("time", seg.start, seg._end, os.date(), " "))
        yield(Candidate("date", seg.start, seg._end, os.date("%Y年%m月%d日 %H时%M分"), " "))
        yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d %H:%M"), " "))
    end
end
