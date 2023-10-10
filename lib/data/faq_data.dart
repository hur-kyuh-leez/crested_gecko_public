const faq_data = [
{
'question': '베타테스트',
'answer': '테스트 테스트',
},
];

const real_faq_data = [
  {
    'question': '왜 이렇게 싼가요?',
    'answer': '전세계 수많은 브리더에게 직접 연락을 취했습니다.\n'
        '많은 오퍼 중, 가장 한국 시장에 필요하고 합리적인 오퍼를 선택 하였습니다.\n또한, 큰 비중은 차지하는 시설비와 인건비를 최소화 하였습니다.\n특히, 제 몫에 인건비 경우 제외 하였습니다.',
  },
  {
    'question': '어떻게 이런 이벤트를 준비 하시게 되셨나요?',
    'answer':
    '첫 아이를 데려오는데 한참을 고민했습니다. 제가 생각 했던 가격보다 너무 비쌌습니다.'
        '감사하게도 좋은 분양자분들을 만났고 아이들 입양을 할 수 있었습니다. 아이들 덕분에 심적으로 평안을 되찾게 되었습니다. 조금 더 많은 분들이 같은 좋은 경험을 하실수 있도록, 이러한 이벤트를 준비하게 되었습니다.'
  },
  {
    'question': '아니, 어떻게 확률이 50%가 넘나요?',
    'answer':
        '부족하지만, 제가 한번 설명해 보겠습니다. 이번 이벤트 구성은 아성체 2마리 그리고 미구분 1마리 입니다. 각 크레 당 암이 나올 확률은 50% 입니다. 그러나 연속적으로 숫숫숫 이나 암암암 이 나올 확률은 0.5^3 입니다. 즉, 1-0.125 = 87.5% 확률로 최소 암컷 한마리를 가져 가실수 있습니다.\n\n*모든 경우의 수: \n암암암, 암암숫, 암숫숫, 숫숫숫, 숫숫암, 숫암암'
  },
  {
    'question': '그러면 모두 암이 뜰 확률도 있네요?',
    'answer': '정확히 캐치 하셨습니다! 12.5%로 상대적으로 낮은 확률이지만 가능 합니다.'
  },
  {
    'question': '그래도 숫숫숫 나오게 되면 어떻게 되나요?',
    'answer': '다음 이벤트 우선권을 드립니다. 우선권을 가진 참여자는 일반 이벤트 참여자 보다 당첨 확률이 높습니다.\n'
  },
  {
    'question': '숫숫숫 확인은 어떻게 하시나요?',
    'answer': '모든 아이가 10g을 넘었을 때 해당 되는 사항 입니다. 미리 최소한 한달에 한번을 꼭 아이들 사진 찍어 놓으시고, 직접 가지고 오셔서 제가 천공 사진 확인 후 다음 래플 확률 조정 해드립니다.'
  },
  {
    'question': '아이들 보려면 어디로 가면 되나요?',
    'answer':
    '죄송합니다. 당첨자분 한하여 오실수 있습니다. 용인시 "흥덕중" 쪽으로 오시면 됩니다.\n'
  },
  {
    'question': '당첨되면 이후 프로세스가 어떻게 되나요?',
    'answer':
    '당첨 공개일을 포함하여 3일 이내 오셔서 데려 가셔야 하며, 데려가지 않을 경우 당첨이 취소 됩니다. 예외 없습니다. 또한, 투명하게 분양하기 위해, 당첨된 분 두분 이상 같은 시간 때 예약을 해드립니다. 부득이 하게 혼자 오셔야 되시는 분은 분양 때 제가 녹음 하니 양해 부탁드립니다. 오실 때 루페와 전자저울 들고 오셔도 되고 제가 보유한 걸 쓰셔도 됩니다. 그렇다고 해서 먼저와 "암암암"을 데려 가실수 있는게 아닙니다. 루페로, 천공이 확실하게 보이는 아이 한명과 천공이 없는 아이 그리고 미구분 아이 데려가시면 됩니다.\n'
  },
  {
    'question': '고속버스택배(고택)은 왜 안되나요?',
    'answer':
        '직접 오셔서 확인하시고 데려가시길 바랍니다. 날씨가 더워 집니다. 아이들에게 스트레스 주고 싶은 마음이 없습니다. 당첨이 되셨더라도 고택에 대해 문의 하면 자동 탈락 됩니다.\n'
  },

  {
    'question': '미성년자는 참여 할 수 없나요?',
    'answer':
        '죄송합니다. 파사모 분쟁글 중 미성년자에 관한 이야기가 꽤나 있어 안됩니다. 단, 파사모에서 신뢰가 높으신 미성년자분들은 환영 합니다.'
  },

  {
    'question': '꼬리 부절, 꼬잘 등에 대해서는 환불 가능 할까요?',
    'answer': '죄송합니다. 그렇게 다 환불 해드리면 이 가격에 아이들 분양을 못합니다. 일반 샵가서 분양 받으시기 바랍니다. 또한, 당첨 되시고 오셔서 아이들 직접 확인하시고 그때 입양 결정 하셔도 됩니다.'
  },
  {
    'question': '폐사에 관해서는요?',
    'answer': '직거래라 환불 불가 합니다.'
  },
  {
    'question': '분양 이후 케어도 해주시나요?',
    'answer': '죄송합니다. 해드리지 않습니다. 케어를 원하시면 샵에서 분양 받으시길 바랍니다.'
  },

  {
    'question': '이정도 가격이면 도매도 하셔도 될 거 같은데, 도매는 안하시나요?',
    'answer': '현재 도매는 안합니다. 대신 직접 수입 하실 수 있도록, 자세한 수입 프로세스 글을 올리니 참고 하시길 바랍니다.'
  },
  {
    'question': '도와드린거 같은데 확률 조정 되었나요?',
    'answer': '제가 따로 리스트 관리 중에 있습니다. 혹시 절 도와준 거 같은데, 확률 조정이 되었는 지 확실하게 알고 싶은 분은 연락 부탁드립니다.'
  },
  {
    'question': '오픈톡에 참여 했어요 확률 조정이 되었나요?',
    'answer': '네 확률 조정 해드렸습니다. 그러나, 래플이기 때문에 확률이 높다고 해도 당첨이 안되실수 있습니다.'
  },
  {
    'question': '회원가입 했어요! 확률 조정이 되었나요?',
    'answer': 'FAQ를 보실 수 있다는 것은 회원가입 하신분이네요. 네 확률 조정 해드렸습니다. 그러나, 래플이기 때문에 확률이 높다고 해도 당첨이 안되실수 있습니다.'
  },
  {
    'question': '다음 이벤트는 언제 인가요? 어떤 걸 하실 생각이 신가요?',
    'answer':
    '정해진 날짜는 없습니다. 생물이 될 수도 있고 용품이 될 수도 있습니다. 소비자를 위한게 아니라 판매자를 위한 수출 일 수도 있습니다.'
  },
];
