RSpec.describe Api::AnalyzesController do

  let(:user) { create :user }

  describe '#analyze' do

    context 'when authorized' do

      before(:each) do
        login
        post :analyze, {data: '1,2,3,4,5,99'}
      end

      it 'returns 200' do
        expect(response.status).to eql(200)
      end

      it 'calculates' do
        analysis = {min: 1.0, max: 99.0, average: 19.0, Q1: 2.0, median: 3.5, Q3: 5.0, outliers: [99.0]}.to_json
        analysis_response = response_body['analysis']
        expect(analysis_response.to_json).to eq(analysis)
      end
    end

    context 'when unauthorized' do

      before(:each) do
        post :analyze, {data: '1,2,3,4,5,99'}
      end

      it 'returns 401' do
        expect(response.status).to eql(401)
      end
    end
  end

  def response_body
    JSON.parse(response.body)
  end
end