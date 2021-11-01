class DocumentsController < ApplicationController
    def index
        @pagy, @documents = pagy(Document.all)
     end
     
     def new
        @document = Document.new
     end
     
     def create
        @document = Document.new(document_params)
        
        if @document.save
           redirect_to documents_path, notice: "The file #{@document.attachment.identifier} has been uploaded."
        else
           render "new"
        end
        
     end

     def edit
        @document = Document.find(params[:id])
     end

      def update
        @document = Document.find(params[:id])
        @document.update(document_params)
        redirect_to documents_path(@documents)
      end
     
     def destroy
        @document = Document.find(params[:id])
        @document.destroy
        redirect_to documents_path, notice:  "The file #{@document.attachment.identifier} has been deleted."
     end
     
     private
     def document_params
        params.require(:document).permit(:uploader, :description, :attachment)
     end 
end
