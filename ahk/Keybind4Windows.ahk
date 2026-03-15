; F13を使ったカーソル・編集系ホットキー
F13 & [::Send {Esc}              ; F13 + [ でEscキー送信
F13 & j::Send {Blind}{Down}      ; F13 + j で下矢印（カーソル下）
F13 & k::Send {Blind}{Up}        ; F13 + k で上矢印（カーソル上）
F13 & l::Send {Blind}{Right}     ; F13 + l で右矢印（カーソル右）
F13 & h::Send {Blind}{Left}      ; F13 + h で左矢印（カーソル左）
F13 & i::Send {Blind}{Home}      ; F13 + i でHomeキー（行頭へ移動）
F13 & a::Send {Blind}{End}       ; F13 + a でEndキー（行末へ移動）
F13 & BS::Send {Del}             ; F13 + バックスペースでDeleteキー
F13 & r::Send {F2}               ; F13 + r でF2キー送信（名前変更など）

; 「；」キーを「:」 「Shift+;」を「:」で出力（sc027は日本語配列の;キー）
sc027::Send, :
+sc027::Send, `;

; Alt(!)との組み合わせ（sc027は日本語配列の;キー）
!h::Send !{Left}                 ; Alt + h でAlt+左矢印（←ブラウザ戻る等）
!l::Send !{Right}                ; Alt + l でAlt+右矢印（→ブラウザ進む等）
!4::Send !{F4}                   ; Alt + 4 でAlt+F4（ウィンドウを閉じる）
!sc027::Send, ``                 ; Alt+; で `
+!sc027::Send, ~                 ; Alt+Shift+; で ~
