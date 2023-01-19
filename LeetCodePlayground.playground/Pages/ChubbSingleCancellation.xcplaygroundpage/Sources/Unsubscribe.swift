import Foundation

public class Unsubscribe {
    let spid = "001937"

    let password = "123456"

    let xmlBody = """
    <soapenv:Envelope xmlns:loc=\"http://www.csapi.org/schema/parlayx/subscribe/manage/v1_0/local\"
    xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\">
       <soapenv:Header>
          <RequestSOAPHeader xmlns=\"http://www.csapi.org/wsdl/parlayx/smap/v1_0/service\">
             <spId>{@spid}</spId>
             <spPassword>{@password}</spPassword>
             <timeStamp>{@timestamp}</timeStamp>
             <serviceId>{@serviceid}</serviceId>
             <OA>{@msisdn}</OA>
          </RequestSOAPHeader>
       </soapenv:Header>
       <soapenv:Body>
          <loc:unSubscribeServiceExtRequest>
             <loc:unSubscribeServiceExtReq>
                <loc:userIdType>1</loc:userIdType>
                <loc:userId>{@msisdn}</loc:userId>
                <loc:unsubscribeServiceInfos>
                   <loc:spId>{@spid}</loc:spId>
                   <loc:productId>{@productid}</loc:productId>
                   <loc:operator>1000</loc:operator>
                   <loc:operatorType>3</loc:operatorType>
                   <loc:reason>1</loc:reason>
                </loc:unsubscribeServiceInfos>
             </loc:unSubscribeServiceExtReq>
          </loc:unSubscribeServiceExtRequest>
       </soapenv:Body>
    </soapenv:Envelope>
    """
}
