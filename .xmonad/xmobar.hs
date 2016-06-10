Config { font = "xft:Source Code Pro:Regular:size=10,Noto Sans CJK JP:Regular:size=9"
       , bgColor = "#1a1e1b"
       , fgColor = "#888888"
       , position = Top
       , lowerOnStart = False
       , hideOnStart = False
       , allDesktops = True
       , persistent = True
       , commands = [ Run Network "enp3s0" [ "-t"       , "<rx> : <tx>"
                                          , "-L"       , "40"
                                          , "-H"       , "200"
                                          , "--normal" , "#d3d7cf"
                                          , "--high"   , "#88b986"
                                          ] 10

                    , Run MultiCpu        [ "-t"       , "<total0>.<total1>.<total2>.<total3>"
                                          , "-L"       , "40"
                                          , "-H"       , "85"
                                          , "--normal" , "#d3d7cf"
                                          , "--high"   , "#c16666"
                                          ] 50

                    , Run Memory          [ "-t"       , "<usedratio>%"
                                          , "-L"       , "40"
                                          , "-H"       , "90"
                                          , "--normal" , "#d3d7cf"
                                          , "--high"   , "#c16666"
                                          ] 10
                    , Run BatteryP        ["CMB1"]
                                          [ "-t"       , "<acstatus>"
                                          , "-L"       , "20"
                                          , "-H"       , "80"
                                          , "--low"    , "#c16666"
                                          , "--normal" , "#d3d7cf"
                                          , "--"
                                                , "-o" , "<left>% (<timeleft>)"
                                                , "-O" , "Charging <left>%"
                                                , "-i" , "<left>%"
                                          ] 50
                    , Run Date "%a %m/%d %H:%M %p" "date" 10
                    , Run StdinReader
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = " %StdinReader% }{ %multicpu% %memory% %enp3s0% <fc=#c7a273>%date%</fc> "
       }
