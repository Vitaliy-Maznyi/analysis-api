RSpec.describe Api::AnalyzesController do

  let(:user) { create :user }

  describe '#correlate' do

    context 'when authorized' do

      before(:each) do
        login
        post :correlate, {dataset_1: '1,2,3,4,5', dataset_2: '11,33,22,55,33'}
      end

      it 'returns 200' do
        expect(response.status).to eql(200)
      end

      it 'correlates' do
        correlation = 0.6396021490668313
        correlation_response = response_body['correlation']
        expect(correlation_response).to eq(correlation)
      end
    end

    context 'when unauthorized' do

      before(:each) do
        post :correlate, {dataset_1: '1,2,3,4,5', dataset_2: '11,33,22,55,33'}
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