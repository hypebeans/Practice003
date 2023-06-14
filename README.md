#  課題03

## 作成日
2023年6月13日

## 使い方（課題01をやっている学生は2を飛ばす）
1. ターミナルを起動する
2. `mkdir ~/Documents/iOSPractice`と入力して新しいフォルダを作成する
3. `cd ~/Documents/iOSPractice`と入力してディレクトリを移動する
4. `git clone https://github.com/MaskerDog/Practice003.git`を実行してリポジトリをローカルにクローンする
5. `open Practice003/Practice003.xcodeproj/`でプロジェクトを開く
6. シミュレーターを起動する
7. 以下の画面が表示されることを確認する

<kbd><img src="https://github.com/MaskerDog/Practice003/assets/37284851/cdd0601d-3402-43fa-ac36-59d9c4e0c3d1" height="500"></kbd>

## 目的
1. Assetsを使った画像の表示ができる
2. Textの位置を変更することができる


## やること1

まず模写をする。  
ContentViewを次のように修正をする。  
**今回は追加・修正をメインに行う**

```Swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 0) {
            Text("多摩地区紹介")
                .font(.system(size: 40, weight: .black))
                // ★★追加する★★
                .frame(maxWidth: .infinity, alignment: .leading)
            // Assets.xcassetsの画像を表示する
            Image("snow")
            
            // ★★追加する★★
            // 画像と文字をくっつかないようにする
            Spacer()
                .frame(height: 10)
            
            Text("小山田緑地")
                .font(.system(size: 30))
            
            // ★★追加する★★
            // タイトルと文字のスペースをあける
            Spacer()
                .frame(height: 10)
            
            Text("小山田緑地（おやまだりょくち）は、東京都町田市に所在する都立公園。")
                // ★★.centerから.leadingに修正する★★
                .multilineTextAlignment(.leading)
            
            Spacer()
            
        }
    }
}
```


<kbd><img src="https://github.com/MaskerDog/Practice003/assets/37284851/80ef2129-7d4d-423c-8d1b-8f90be2ec11f" height="500"></kbd>


## やること2

やること1で追加した`.frame(maxWidth: .infinity, alignment: .leading)`のalignmentを`.trailing`に変更し、どのような変化があったか確認をする。
その後、`.center`にも変更し、変化を確認する。  
最後に`.leading`に戻す。


## やること3

`.frame(maxWidth: .infinity, alignment: .leading)`のmaxWidthを200に変更し、どのような変化があったか確認をする。  
確認をしたらmaxWidthを`.infinity`に戻す。  

* .frameは見えない領域を作り出し、その中にViewを配置する仕組みである。
* maxWidthは「フレーム（枠）が持てる最大の大きさ」なので、それ以上大きくはならない。
* 単なるwidthの場合は、「フレーム（枠）の大きさの固定」である。

<kbd>![image](https://github.com/MaskerDog/Practice003/assets/37284851/40afe83a-2fa1-43dd-be13-487d66371707)</kbd>

## やること4

まず、Imagesディレクトリにある「park.png」「park@2x.png」「park@3x.png」の画像を確認する。  
Assets.xcassetsを開き、Assetsの中にImagesディレクトリにある「park.png」「park@2x.png」「park@3x.png」をまとめてドラッグ・アンド・ドロップする。  
その後、ContentViewにある`Image("snow")`を`Image("park")`に変更する。 
画像が変わったことを確認する。 

## やること5

selectable表示に変更し、`Image("park")`をクリックしてImageの領域を確認する。  
画面からはみ出ている状態で良い。  

* ImageでAssetsの画像を表示する場合、元の画像の大きさを維持しようとする。
* 前述の`.frame`で領域を変更しても、Imageが持つ画像を全部表示しようとする。

<kbd>![image](https://github.com/MaskerDog/Practice003/assets/37284851/fb4259d4-5eba-4c16-9554-a00e7ce9a818)</kbd>


サイズを変えたい場合は、`.resizable()`を使う。

```Swift
            Image("park")
                .resizable()
```

<kbd><img src="https://github.com/MaskerDog/Practice003/assets/37284851/db3603c4-e0ef-4379-aa9e-e2ace239af75" height="500"></kbd>


縦横比（アスペクト比）が変わってしまうので、次のように修正をする。

```Swift
            Image("park")
                .resizable()
                .aspectRatio(contentMode: .fit)
```

`.fit`は画像を領域内に全て表示しようと縮小をする。`.fill`を指定することもできるが、こちらは領域内に隙間なく画像を表示しようとする。

## やること6

```Swift
            Text("小山田緑地（おやまだりょくち）は、東京都町田市に所在する都立公園。")
                // ★★.centerから.leadingに修正する★★
                .multilineTextAlignment(.leading)
```

multilineTextAlignmentは複数行のテキスト表示の時にどの位置にテキストを表示するかを決める機能（ここではモディファイアと呼ぶ）である。  

`.multilineTextAlignment(.leading)`を`.multilineTextAlignment(.trailing)`に変更し、どのような変化があったか確認をする。  
その後、`.leading`に戻す。
