class Arquivo < ApplicationRecord
 mount_uploader :attachment, AttachmentUploader
has_many :dados
end
