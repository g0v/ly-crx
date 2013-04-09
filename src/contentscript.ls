if 'misq.ly.gov.tw' is document.location.hostname

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
    [_, billNo]? = $self.attr \onclick .match /queryBillDetail\('(.*)'\)/
    if billNo
      $self.attr \onclick null .attr \href "http://misq.ly.gov.tw/MISQ/IQuery/misq5000QueryBillDetail.action?billNo=#billNo"

