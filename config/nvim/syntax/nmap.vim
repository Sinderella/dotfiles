
if exists("b:current_syntax")
  finish
endif

let b:current_syntax = "nmap"

syntax match nmapHeader "\v# Nmap .*$"
highlight link nmapHeader PreProc

syntax match hostTarget "\v.*" contained
highlight link hostTarget PreProc

syntax match nmapReport "\vNmap scan report for" nextgroup=hostTarget skipwhite
highlight link nmapReport Keyword

syntax match info "\vIncreasing send delay.*$"
syntax match info "\vAll [0-9]+ scanned ports.*$"
syntax match info "\vNot shown: .*$"
highlight link info Comment

syntax keyword state open closed filtered contained
highlight link state Type

syntax match port "\v[0-9]+/(tcp|udp)" contained
highlight link port Identifier

syntax keyword service http https
highlight link service Special

syntax region portReport start=/\vPORT/ skip=/\v\\./ end=/\v\n\n/ contains=state,port
highlight link portReport String

