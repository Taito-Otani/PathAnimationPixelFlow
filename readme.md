# InkEffect path animater
The project is  pixel flow of using path animation with processing.
・InkEffectInteractive ・・・Interactive generate a simulation of ink effect.
・InkEffectPathAnim  ・・・Loading path(json) to make ink simulation.
・pathGenerater　　  ・・・The app is for generate of path animation.
・pathGeneraterPerframes　・・・The app is loading sequence path animation for generate of path animation

#InkEffectInteractive
・Run
・Generate effect by mouse point

# InkEffectPathAnimの使い方
pathGenerater

・Set Frame rate
・Set picture
・Run
・Use the mouse
・Stop app
・Output json file

## pathGeneraterPerframes
・copy sequence images to data/seq
・Run
・Red Screen is loading image
・When get loading image.
・clicking mouse left is write path.
・press space key is write nothing path
・press other key is write back to frame.

## InkEffectPathAnim（generate ink effect's image sequnce）
・copy json file to same directory of pixelFlowPathAnim.pde
・start pixelFlowPathAnim.pde
・Check comment-in saveFrames() at 100 line
・Run(Generete ink effect image file sequence)


# memo
・using processing's pixelFlow
  [A Processing/Java library for high performance GPU-Computing (GLSL).](https://github.com/diwi/PixelFlow)
・json file is written x,y positions.

# Todo
・connecting path generater and ink effect app
・output 4K images

--------------------------------
JP follow
# pixel Flow animater
processing(java)で作ったパスアニメーションできるpixel flowです。

・InkEffectInteractive ・・・インタラクティブにマウスでインクエフェクトを描ける
・InkEffectPathAnim  ・・・json形式のパスを読み込んでインクエフェクトを描画します。
・pathGenerater　　  ・・・jSon形式のパスアニメーションを生成するアプリ。
・pathGeneraterPerframes　・・・連番画像ファイルを読み込んで、1フレームずつjSon形式でアニメーションパスを生成

#InkEffectInteractive
・左上の再生ボタンでアプリを実行
・マウスでなぞるとエフェクトが出現

# InkEffectPathAnimの使い方
pathGenerater

・再生ボタンを押すとアプリが実行される。
・フレームレートを設定。
・ガイドとなる画像を設定（必要なら）
・マウスでなぞる
・アプリを停止する
・座標がjson形式でに書き込み出力される。

## pathGeneraterPerframes
・再生ボタンを押すとアプリが実行される。
・赤い画面はローディング中
・画像が読み込まれたら
・マウスクリックでパスを書き込み、スペースキーでスキップ、その他のキーで戻る

## InkEffectPathAnimの操作（連番書き出し）
・以上で作成したjsonファイルをpixelFlowPathAnim.pdeと同じ階層にコピー
・pixelFlowPathAnim.pdeを起動
・100行目あたりsaveFrames()をコメントインされているか確認。
・再生ボタンを押すとpngの連番が実時間で書き出される



# メモ
・processingライブラリーpixelFlowを使用しています。
  [A Processing/Java library for high performance GPU-Computing (GLSL).](https://github.com/diwi/PixelFlow)
・json形式のファイルは、毎フレームx,y座標が格納されています。
・pathGeneraterPerframes/data/seq内に画像シーケンスを格納してください。
・rename.pyで「img_###.png」にリネームするとスムーズです。


# Todo
・パスアニメーションと生成アプリの統一。
・4K解像度の書き出しを行えるようにしたい。
