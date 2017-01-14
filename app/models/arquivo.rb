class Arquivo < ApplicationRecord
mount_uploader :attachment, AttachmentUploader
validates_presence_of :attachment
validates_integrity_of :attachment
validates_processing_of :attachment

has_many :dados



end
