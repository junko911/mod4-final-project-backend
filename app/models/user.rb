class User < ApplicationRecord
    has_many :likes
    has_many :cats, through: :likes
    has_secure_password
    validates :username, uniqueness: {case_sensitive: false, message: 'Shoot! Someone is already using this username...'}
    validates :username, presence: { message: 'You need a username! How else will we know what to call you?'}
    has_many :active_relationships, class_name: "Relationship", foreign_key: :follower_id, dependent: :destroy
    has_many :followeds, through: :active_relationships, source: :followed
    has_many :passive_relationships, class_name: "Relationship", foreign_key: :followed_id, dependent: :destroy
    has_many :followers, through: :passive_relationships, source: :follower

    def as_json(_options = nil)
        {
            id: id,
            name: name,
            username: username,
            avatar: avatar,
            bio: bio,
            followers: followers.map { |following|
                {
                    id: id,
                    name: name,
                    username: username,
                    avatar: avatar,
                    bio: bio
                }
            },
            followeds: followeds.map { |followed|
                {
                    id: id,
                    name: name,
                    username: username,
                    avatar: avatar,
                    bio: bio
                }
            }
        }
    end
end
