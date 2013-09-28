# language: ja

@javascript
フィーチャ: ユーザーはTwitterのお気に入りを見ることができる
  ユーザーとして、
  FavtileでTwitterのお気に入りを見たい
  なぜなら、Favtileでお気に入りを表示するとTwitterで表示するより見やすいからだ

  シナリオ: サインインしたあと、自身のお気に入りが見れる
    背景 hanachin_ が "はー。お腹すいた。" をふぁぼった
    背景 hanachin_ が "はー。もう朝じゃん、寝ろよ。" をふぁぼった
    もし hanachin_ としてサインインした
    ならば "はー。お腹すいた。" が表示されている
    ならば "はー。もう朝じゃん、寝ろよ。" が表示されている
