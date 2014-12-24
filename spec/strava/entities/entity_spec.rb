require 'spec_helper'

module Strava
  module Entities
    class TestEntity < Entity
      ATTRIBUTES = [:id]
    end

    describe Entity do
      it 'exposes the hash attributes' do
        id = 1
        entity = TestEntity.new({ id: id })

        expect(entity.id).to be(id)
      end

      it 'raises exception when invalid attribute' do
        expect do
          TestEntity.new({ fake: 'FOO' })
        end.to raise_exception(Entity::InvalidAttribute)
      end

      context 'comparison' do
        context 'all attributes are the same' do
          it 'compares positively' do
            entity1 = TestEntity.new({ id: 1 })
            entity2 = TestEntity.new({ id: 1 })

            expect(entity1).to eq(entity2)
          end
        end

        context 'some attribute differs' do
          it 'compares negatively' do
            entity1 = TestEntity.new({ id: 1 })
            entity2 = TestEntity.new({ id: 2 })

            expect(entity1).to_not eq(entity2)
          end
        end
      end
    end
  end
end
