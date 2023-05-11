require "httparty"

describe "POST /Visit" do
  it "Criar nova Visita" do

    #Criação de um payload para enviar no body
    payload = {
      data: "2023-05-10",
      user_id: 4,
      checkin_at: "2023-05-09T09:00:00Z",
      checkout_at: "2023-05-11T18:00:00Z",
      status: "lalala"
    }

    response = HTTParty.post(
      "http://127.0.0.1:3000/visits",
      body: payload.to_json,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo1LCJleHAiOjE2ODM4NjA3NzB9.OSju8RzbRqYz0F0M__c0MdR1YEnwKI6qb39tDH9nCF0"
      },
     )

      expect(response.code).to eql 201

  end
end
