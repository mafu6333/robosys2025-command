# linenumber

標準入力から受け取ったテキストに行番号を付けて出力するコマンドです。
パイプ処理でのログ確認やテキスト整形を想定しています。

## Usage

```bash
$ printf "apple\nbanana\n" | ./linenumber
1 apple
2 banana

## Requirements
- Python 3
- Linux / WSL / macOS

## License
MIT License

## Acknowledgements
- Individual work
