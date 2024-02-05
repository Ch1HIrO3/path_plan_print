# テーブル設計

## schedules テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| name       | string | null: false |
| password   | string | null: false |

### Association

- has_many :summaries
- has_many :dates

## summaries テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| title      | string     |                                |
| content    | text       |                                |
| schedules  | references | null: false, foreign_key: true |


### Association

- belongs_to :schedule

## dates テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| dates     | date       | null: false                    |
| plan      | references |                                |
| schedules | references | null: false, foreign_key: true |

### Association

- belongs_to :schedule
- has_many :plans

## plans テーブル

| Column      | Type    | Options                        |
| ----------- | ------- | ------------------------------ |
| time        | time    |                                |
| title       | string  | null: false                    |
| description | text    |                                |
| dates       | date    | null: false, foreign_key: true |

### Association

- belongs_to :schedule
- has_many :plans
