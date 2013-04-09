console.log \content
if 'misq.ly.gov.tw' is document.location.hostname
  $ document .find 'a[onclick*=queryBillDetail\\(]' .each ->
    $self = $ @
    [_, billNo]? = $self.attr \onclick .match /queryBillDetail\('(.*)'\)/
    if billNo
      $self.attr \onclick null .attr \href "http://misq.ly.gov.tw/MISQ/IQuery/misq5000QueryBillDetail.action?billNo=#billNo"

