# hydrogen-vs-astra

"누구나쉽게" 11편 실험 자료입니다. Gemini 4 Hydrogen, GPT-6 Astra, Claude Sonnet 5.5, GPT-6.1 Terra 네 모델에게 같은 프롬프트를 한 번씩만 주고 WebGL2 결과물을 만들게 한 다섯 라운드의 원본과 숫자를 모았습니다.

- 페이지: https://techkwon.github.io/hydrogen-vs-astra/
- 영상: https://youtu.be/n4Cxks1eaw4 (2026-11-13 공개)
- 페이지의 모든 숫자는 `data.json`에서 읽어 옵니다.

## 들어 있는 것

| 경로 | 내용 |
| --- | --- |
| `index.html` | 자료 페이지 (외부 라이브러리 없음, `data.json`을 fetch로 읽음) |
| `data.json` | 모델·단가·라운드별 시간/크기/토큰/비용·점수·심사 이유·합계·한계 |
| `runs/<라운드>/<모델>/index.html` | 모델이 만든 결과물 원본. 브라우저에서 바로 실행됩니다 |
| `video/<라운드>-<모델>.mp4` | 결과물 녹화본 (960px, 소리 없음) |
| `poster/<라운드>-<모델>.jpg` | 녹화본 첫 화면 |
| `prompts/<라운드>.txt` | 라운드별 프롬프트 전문 |
| `judge/<라운드>/` | 이름을 가린 A~D 심사 시트(`sheet.jpg`), 정답표(`mapping.json`), 심사위원별 투표(`vote-*.json`) |
| `scripts/` | 실행·녹화·심사에 쓴 스크립트 |

라운드 id: `water`, `globe`, `store`, `city`, `blackhole`
모델 id: `hydrogen`, `astra`, `sonnet`, `terra`

## 채점 방식

AI 심사위원 4명(= 참가 모델 넷)이 이름을 가린 A·B·C·D 캡처 시트를 보고 1~4위를 매겼습니다. 1위 4점부터 4위 1점까지, 라운드당 최대 16점입니다. 자기 작품에 준 표를 뺀 합계도 `data.json`의 `totals.points_excluding_self`에 있습니다.

## 한계

- 과제마다 한 번씩만 실행했습니다. 다시 하면 결과가 달라질 수 있습니다.
- 심사는 녹화 캡처(정지 화면)만 보고 했습니다. 소리와 조작감은 심사에 들어가지 않았습니다.
- 녹화 브라우저가 마우스 잠금을 막아서, 도시 라운드는 네 모델 모두 같은 보조 코드(pointer-lock shim)를 넣고 녹화했습니다. 결과물 파일 자체는 수정하지 않았습니다.
- Hydrogen·Astra 비용은 토큰 수 × 공식 단가로 계산한 추정값입니다(캐시된 입력 제외). Sonnet은 도구가 보고한 금액이고, Terra는 단가를 확인하지 못했습니다.
- 프롬프트 5개는 공식 데모 설명을 바탕으로 직접 쓴 것입니다(공식 프롬프트 원문은 공개되지 않음).

## 로컬에서 보기

`data.json`을 fetch로 읽기 때문에 파일을 직접 열면 동작하지 않습니다. 이 폴더에서 간단한 웹 서버를 띄워서 보세요.

```sh
python3 -m http.server 8000
```
