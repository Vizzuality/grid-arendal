class AddEpsIdAndPdfIdToMediaContents < ActiveRecord::Migration[5.0]
  def change
    add_column :media_contents, :eps_id, :integer
    add_column :media_contents, :pdf_id, :integer
  end
end
