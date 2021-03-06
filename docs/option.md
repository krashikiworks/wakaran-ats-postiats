# option

`patscc`と`patsopt`のコマンドライン引数についてのまとめ

## patscc

### `--help`

`patscc`のヘルプメッセージを表示する

#### `-h`

`--help`の短縮形。

### `-hats`

`patsopt`のヘルプメッセージを表示する

拡張子の`.hats`と非常に紛らわしいが関係はない

### `-vats`

`patsopt`のバージョン情報を表示する

ちなみにATS/Postiatsに`.vats`という拡張子は存在しない

### `-ccats`

`patscc`にATSコードからCコードを生成するのみで、それをCコンパイラによってバイナリへとコンパイルはしないよう要求する

`.cats`ファイルとは何も関係ない

### `-tcats`

型検査のみを行うよう要求する

`.cats`ファイルとは何も関係ない

### `--gline`

生成されたCコードへ行プラグマ情報(line pragma information)を埋め込むよう要求する

### `-verbose`

詳細な実行時情報を表示する

### `-cleanaft`

実行終了時に生成されたCコードを削除する

### `-atsccomp`

    patscc -atsccomp <option>

このフラグに続く次の引数がCコンパイラへの引数として渡される。
このフラグが存在しない場合、環境変数`ATSCCOMP`がCコンパイラのコマンドとして解釈される。

### `-DATS`

    patscc -DATS <name=variable>

このフラグに続く次の引数(`名前=値`の形)が`patsopt`の引数として渡される。

拡張子の`.dats`と非常に紛らわしいが関係はない

### `-DDATS`

    patscc -DDATS <name=variable>

このフラグに続く次の引数(`名前=値`の形)が`patsopt`とCコンパイラ両方の引数として渡される。

`.dats`ファイルとは何も関係ない

### `-IATS`

    patscc -IATS <path>

このフラグに続く引数は`patsopt`にインクルードパスとして渡される。

ちなみにATS/Postiatsに`.iats`という拡張子は存在しない。

### `-IIATS`

    patscc -IIATS <path>

このフラグに続く引数は`patsopt`とCコンパイラ両方にインクルードパスとして渡される。

### `-fsats`

    patscc -fsats <filename>

このフラグに続く引数はソースの静的ファイルの名前として扱われる。
なお、ソースのファイル名が拡張子`.sats`で終わっている場合はこのフラグは必要ない。

### `-fdats`

    patscc -fdats <filename>

このフラグに続く引数はソースの動的ファイルの名前として扱われる。
なお、ソースのファイル名が拡張子`.dats`で終わっている場合はこのフラグは必要ない。

### `--tlcalopt-disable`

このフラグはATSコンパイラの末尾呼出し最適化を無効にする。
`atscc2erl`や`atscc2scm`といったATSコンパイラを利用するのに必要となるフラグ。

### `--constraint-ignore`

型検査の際に制約解決を無視するよう要求する。
これは危険なフラグであり、制約解決に外部ソルバを利用するなどの適切な理由無しに使用してはいけない。

### `--constraint-export`

注意: **未実装**

型検査の際、外部ソルバで利用できるように制約を出力する。

## `patsopt`

### `--version`

バージョン情報を表示する。

#### `-v`

`--version`の短縮形。

### `--help`

ヘルプを表示する。

#### `-h`

`-v`の短縮形。

### `--static`

    patsopt --static <filenames>

ATSの静的ファイルを(個別に)コンパイルする。

#### `-s`

`--static`の短縮形。

### `--dynamic`

    patsopt --dynamic <filenames>

ATSの動的ファイルを(個別に)コンパイルする。

#### `-d`

`--dynamic`の短縮形。

### `--dynamics`

    patsopt --dynamics <filenames>

ATSの動的ファイルを結合してコンパイルする。

#### `-dd`

`--dynamics`の短縮形。

### `--output`

    patsopt --output <filename>

出力ファイルの名前を指定する

#### `-o`

`--output`の短縮形。

#### `--output-w`

不明(helpには"output-write into filename"とある)

#### `--output-a`

不明(helpには"output-append into filename"とある 出力ファイルに追記する?)

### `--compile`

C言語にコンパイル(トランスパイル)する。

#### `-cc`

`--compile`の短縮形。

### `--typecheck`

型検査のみ行う(実行ファイルやC言語ソースコードは作成しない)。

#### `-tc`

`--typecheck`の短縮形。

### `--depgen`

ファイルの依存関係を生成する。

### `--taggen`

構文エンティティのタグ付け情報を生成する。

### `--gline`

ターゲットとして生成されたソースコードに行プラグマ情報を生成する。

### `--debug`

ターゲットとして生成されたソースコードにデバッグ情報を生成する。

#### `--debug2`

`--debug`とほぼ同じ。
`--debug2`よりも`--debug`の方が"more infomative"らしい。

### `--atsreloc`

必要なパッケージの再配置をサポートするスクリプトを生成する。

### `--codegen-2`

"level-2構文"からコードを出力する。

#### `--jsonize-2`

"level-2構文"からJSONベースのコードを出力する。

### `--tlcalopt-disable`

末尾呼び出し最適化を無効にする。

### `--constraint-export`

制約関係をJSONフォーマットで出力する。

### `--constraint-ignore`

制約関係を無視する。

## 外部Cコンパイラへのフラグ

patsccの実行にあたって、patsccのオプションとして解釈されない引数を渡した場合、それは後続のCコンパイラへのフラグとして扱われる。

例えば:

    patscc --version

は一見patsccのバージョン情報を出力するかのように見えるが、実際にはpatsccには`--version`オプションは無いため、

    cc --version

となり、結果として出力はCコンパイラ(大抵はgccかclang)のバージョン情報となる。

そして、ATSは一旦C言語へのトランスパイルを介してバイナリへコンパイルされるため、適切なコンパイル時引数を渡さないと(生成されたC言語の)コンパイルに失敗する。

### `-DATS_MEMALLOC_LIBC`

コードが動的メモリ確保している場合、言い換えるとヒープを使用している場合、コンパイルにはこのオプションを付ける必要がある。
コード内で`dataviewtype`を使用している場合などが該当する。

言い換えると、このコンパイルオプションを使わずにコードがコンパイルに成功するなら、そのコードはヒープを必要としないことの証明になる(はず)。

### `-DATS_MEMALLOC_GCBDW`

コードにGC(Boehm GC)を埋め込む。GCによるメモリ回収が必要な場合、コンパイルにはこのオプションを付ける必要がある。
コード内で`datatype`を使用している場合などが該当する。

言い換えると、このコンパイルオプションを使わずにコードがコンパイルに成功するなら、そのコードはGCを必要としないことの証明になる(はず)。

注: patsccでATSソースコードから一気にバイナリまで生成したい場合(つまりほとんどの場合)、`-lgc`も一緒に渡す必要がある。

### `-D_ATS_EXCEPTION_NONE`

コードが例外を使用しない場合、このフラグを渡すことができる。

これは生成されるバイナリのサイズを(おそらく例外用のランタイムを除去することで)小さくすることができる。

また、これはコードが例外を使用していないことのチェックとしても機能する(はず…)。
