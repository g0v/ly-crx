switch document.location.hostname
| 'misq.ly.gov.tw'
  if document.location.pathname is "/MISQ/IQuery/misq5000QueryBillDetail.action"
    billNo = $ document .find 'form#queryForm input[name=billNo]' .val!
    $.ajax do
      method: \GET
      dataType: \json
      url: 'http://api.ly.g0v.tw/v0/collections/bills'
      data: {+fo, q: JSON.stringify bill_id: billNo}
      error: -> console.log \error it
      success: -> console.log \woot it

  $ document .find 'a[onclick*=queryBillDetail\\(]' .each ->
    $self = $ @
    [_, billNo]? = $self.attr \onclick .match /queryBillDetail\('(.*?)'\)/
    if billNo
      $self.attr \onclick null .attr \href "http://misq.ly.gov.tw/MISQ/IQuery/misq5000QueryBillDetail.action?billNo=#billNo"

| 'lis.ly.gov.tw'
  $doc = $ document
  ttsdisplay = $doc.find 'select[name="_TTS.DISPLAYPAGE"]'
  if ttsdisplay.length
    [_, entries]? = $doc.text!match /共(\d+)筆，本頁顯示/
    results = $doc .find 'input[name="_IMG_顯示結果"]'
    $ '<button>download all</button>'
      .click ->
        $doc.find 'select[name="_TTS.DISPLAYPAGE"]' .get 0 .options.0.value = entries
        $doc.find 'input[name="_IMG_顯示詳目"]'
          if ..length
            ..click!
          else
            results.click!
        return false
      .insertAfter results
