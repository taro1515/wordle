//
//  PkDatabase.swift
//  wordle
//
//  Created by 永末拓朗 on 2022/09/04.
//

import Foundation
import SQLite

let FILE_NAME = "pokemon.db"

class Database {
    let db: Connection
    let userDatastore: UsePkDatabase
    
    init() {
    // DBファイルの作成先のパスを生成
    let filePath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(FILE_NAME).path
    // DBファイル作成/開く
    db = try! Connection(filePath)
      
    // UsePkDatabaseを初期化
    userDatastore = UsePkDatabase(db: db)
  }
}

class UsePkDatabase{
    private let table = Table("pokemon")
    private let no = Expression<Int>("no")
    private let name = Expression<String>("name")
    private let db: Connection

    init(db: Connection) {
        self.db = db
        do {
            try self.db.run(table.create { t in
                t.column(Expression<Int>("no"), primaryKey: true)
                t.column(Expression<String>("name"))
            })
            // 初期データを入れる
            let migrationItems = [
                ["name": "フシギダネ"],
                ["name": "フシギソウ"],
                ["name": "フシギバナ"],
                ["name": "ヒトカゲ"],
                ["name": "リザード"],
                ["name": "リザードン"],
                ["name": "ゼニガメ"],
                ["name": "カメール"],
                ["name": "カメックス"],
                ["name": "キャタピー"],
                ["name": "トランセル"],
                ["name": "バタフリー"],
                ["name": "ビードル"],
                ["name": "コクーン"],
                ["name": "スピアー"],
                ["name": "ポッポ"],
                ["name": "ピジョン"],
                ["name": "ピジョット"],
                ["name": "コラッタ"],
                ["name": "ラッタ"],
                ["name": "オニスズメ"],
                ["name": "オニドリル"],
                ["name": "アーボ"],
                ["name": "アーボック"],
                ["name": "ピカチュウ"],
                ["name": "ライチュウ"],
                ["name": "サンド"],
                ["name": "サンドパン"],
                ["name": "ニドラン♀"],
                ["name": "ニドリーナ"],
                ["name": "ニドクイン"],
                ["name": "ニドラン♂"],
                ["name": "ニドリーノ"],
                ["name": "ニドキング"],
                ["name": "ピッピ"],
                ["name": "ピクシー"],
                ["name": "ロコン"],
                ["name": "キュウコン"],
                ["name": "プリン"],
                ["name": "プクリン"],
                ["name": "ズバット"],
                ["name": "ゴルバット"],
                ["name": "ナゾノクサ"],
                ["name": "クサイハナ"],
                ["name": "ラフレシア"],
                ["name": "パラス"],
                ["name": "パラセクト"],
                ["name": "コンパン"],
                ["name": "モルフォン"],
                ["name": "ディグダ"],
                ["name": "ダグトリオ"],
                ["name": "ニャース"],
                ["name": "ペルシアン"],
                ["name": "コダック"],
                ["name": "ゴルダック"],
                ["name": "マンキー"],
                ["name": "オコリザル"],
                ["name": "ガーディ"],
                ["name": "ウインディ"],
                ["name": "ニョロモ"],
                ["name": "ニョロゾ"],
                ["name": "ニョロボン"],
                ["name": "ケーシィ"],
                ["name": "ユンゲラー"],
                ["name": "フーディン"],
                ["name": "ワンリキー"],
                ["name": "ゴーリキー"],
                ["name": "カイリキー"],
                ["name": "マダツボミ"],
                ["name": "ウツドン"],
                ["name": "ウツボット"],
                ["name": "メノクラゲ"],
                ["name": "ドククラゲ"],
                ["name": "イシツブテ"],
                ["name": "ゴローン"],
                ["name": "ゴローニャ"],
                ["name": "ポニータ"],
                ["name": "ギャロップ"],
                ["name": "ヤドン"],
                ["name": "ヤドラン"],
                ["name": "コイル"],
                ["name": "レアコイル"],
                ["name": "カモネギ"],
                ["name": "ドードー"],
                ["name": "ドードリオ"],
                ["name": "パウワウ"],
                ["name": "ジュゴン"],
                ["name": "ベトベター"],
                ["name": "ベトベトン"],
                ["name": "シェルダー"],
                ["name": "パルシェン"],
                ["name": "ゴース"],
                ["name": "ゴースト"],
                ["name": "ゲンガー"],
                ["name": "イワーク"],
                ["name": "スリープ"],
                ["name": "スリーパー"],
                ["name": "クラブ"],
                ["name": "キングラー"],
                ["name": "ビリリダマ"],
                ["name": "マルマイン"],
                ["name": "タマタマ"],
                ["name": "ナッシー"],
                ["name": "カラカラ"],
                ["name": "ガラガラ"],
                ["name": "サワムラー"],
                ["name": "エビワラー"],
                ["name": "ベロリンガ"],
                ["name": "ドガース"],
                ["name": "マタドガス"],
                ["name": "サイホーン"],
                ["name": "サイドン"],
                ["name": "ラッキー"],
                ["name": "モンジャラ"],
                ["name": "ガルーラ"],
                ["name": "タッツー"],
                ["name": "シードラ"],
                ["name": "トサキント"],
                ["name": "アズマオウ"],
                ["name": "ヒトデマン"],
                ["name": "スターミー"],
                ["name": "バリヤード"],
                ["name": "ストライク"],
                ["name": "ルージュラ"],
                ["name": "エレブー"],
                ["name": "ブーバー"],
                ["name": "カイロス"],
                ["name": "ケンタロス"],
                ["name": "コイキング"],
                ["name": "ギャラドス"],
                ["name": "ラプラス"],
                ["name": "メタモン"],
                ["name": "イーブイ"],
                ["name": "シャワーズ"],
                ["name": "サンダース"],
                ["name": "ブースター"],
                ["name": "ポリゴン"],
                ["name": "オムナイト"],
                ["name": "オムスター"],
                ["name": "カブト"],
                ["name": "カブトプス"],
                ["name": "プテラ"],
                ["name": "カビゴン"],
                ["name": "フリーザー"],
                ["name": "サンダー"],
                ["name": "ファイヤー"],
                ["name": "ミニリュウ"],
                ["name": "ハクリュー"],
                ["name": "カイリュー"],
                ["name": "ミュウツー"],
                ["name": "ミュウ"]
            ]
            migrationItems.forEach { row in
                try? insert(name: row["name"]!)
            }
        } catch {}
    }
    
    func insert(name: String) throws {
        let insert = table.insert(self.name <- name)
        try db.run(insert)
    }
    
    func select(no: Int) -> String {
        var result = ""
        // エラー起こした場合は空の配列を返却
        guard let users = try? db.prepare(table.where(self.no == no)) else {
            return result
        }
        for row in users {
            result = row[self.name]
        }
        return result
    }
}

class Pokemon {
  let no: Int
  let name: String
    
  init(no: Int, name: String) {
    self.no = no
    self.name = name
  }
}
