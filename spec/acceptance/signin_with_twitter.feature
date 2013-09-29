# language: ja

@javascript
フィーチャ: ユーザーはTwitter認証でFavtileにサインインできる
  ユーザーとして、
  Twitter認証をしてFavtileにサインインしたい。
  なぜなら、ユーザーは既にTwitterを使っていて、Favtileを使ってTwitterのお気に入りを眺めたいからだ。
  Favtileでお気に入りを眺めるためには、Twitter認証が必要だ。

  シナリオ: トップページを表示し、サインインのリンクを踏んで、Twitter認証をし、Favtileにサインインする
    前提 hanachin_ はTwitterでツイートをふぁぼった
    前提 hanachin_ としてTwitter認証に成功する
    もし トップページを表示する
    もし "Signin with Twitter" をクリックする
    ならば "hanachin_" のお気に入りページが表示される
