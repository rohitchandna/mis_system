require 'rubygems'
require "net/http"
require "uri"
require 'nokogiri'

require 'rexml/document'
require 'crack' # for xml and json
#uri = URI.parse("http://192.168.0.5")

a = Time.now.to_s 
narration = "abc"
special_note_narration = 'xyz'
bill_number = 'a/2014/12'
client_name_tally = 'rohit'
final_figure = '2000'
professional_fees_paid = '5000'
amount_calculated ='25000' 
service_tax_paid = '12'

message='<ENVELOPE>
    <HEADER>
    <VERSION>1</VERSION>
    <TALLYREQUEST>Import</TALLYREQUEST>
    <TYPE>Data</TYPE>
    <ID>Vouchers</ID>
    </HEADER>
<BODY>
    <DESC>
        <STATICVARIABLES>
           <SVCURRENTCOMPANY>
                    Regal Solutions Pvt. Ltd. (From 1-Apr-2011)
                </SVCURRENTCOMPANY>
        </STATICVARIABLES>
    </DESC>
        <DATA>
            <TALLYMESSAGE>
                <VOUCHER>
		
                <DATE>' + a + '</DATE>
                <NARRATION>' + narration + '  '+ special_note_narration +'</NARRATION>
                <VOUCHERTYPENAME>Sales</VOUCHERTYPENAME>
                <VOUCHERNUMBER>' + bill_number + '</VOUCHERNUMBER>
                <ALLLEDGERENTRIES.LIST>
                    <LEDGERNAME>'  + client_name_tally + '</LEDGERNAME>
                    <ISDEEMEDPOSITIVE>Yes</ISDEEMEDPOSITIVE>
                    <AMOUNT>' + final_figure + '</AMOUNT>
                    <BILLALLOCATIONS.LIST>
                    <NAME>' + bill_number + '</NAME>
                    <BILLTYPE>New Ref</BILLTYPE>
                    <TDSDEDUCTEEISSPECIALRATE>No</TDSDEDUCTEEISSPECIALRATE>
                       <AMOUNT>' + final_figure + '</AMOUNT>
                       <INTERESTCOLLECTION.LIST>        </INTERESTCOLLECTION.LIST>
                    </BILLALLOCATIONS.LIST>
                </ALLLEDGERENTRIES.LIST>
                   
                <ALLLEDGERENTRIES.LIST>
                    <LEDGERNAME>'  + professional_fees_paid  + '</LEDGERNAME>
                    <ISDEEMEDPOSITIVE>No</ISDEEMEDPOSITIVE>
                    <AMOUNT>' + amount_calculated + '</AMOUNT>
                </ALLLEDGERENTRIES.LIST>
               
                <ALLLEDGERENTRIES.LIST>
                    <LEDGERNAME>Service Tax Payable @ 12.36%</LEDGERNAME>
                    <ISDEEMEDPOSITIVE>No</ISDEEMEDPOSITIVE>
                    <AMOUNT>'  + service_tax_paid + '</AMOUNT>
                    <BILLALLOCATIONS.LIST>
                    <NAME>' + bill_number + '</NAME>
                    <BILLTYPE>New Ref</BILLTYPE>
                    <TDSDEDUCTEEISSPECIALRATE>No</TDSDEDUCTEEISSPECIALRATE>
                    <AMOUNT>' + service_tax_paid + '</AMOUNT>
                    <INTERESTCOLLECTION.LIST>        </INTERESTCOLLECTION.LIST>
                    </BILLALLOCATIONS.LIST>
                  </ALLLEDGERENTRIES.LIST>
                </VOUCHER>
            </TALLYMESSAGE>
        </DATA>
</BODY>
</ENVELOPE> '



#http = Net::HTTP.new(uri.host, 9000)
#http.use_ssl = true
#http.verify_mode = OpenSSL::SSL::VERIFY_NONE
#request = Net::HTTP::Post.new(uri.request_uri)
#request.content_type = "xml"
#request.body = message
# response = http.request(request)
#p   response.body
p Crack::XML.parse(message)

 message

