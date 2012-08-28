package academia

import org.grails.plugins.imagetools.ImageTool;


class Usuario {

	String nome
	String email
	String password
	byte[] avatar
	
    static constraints = {
		avatar(nullable:true, maxSize: 24000, height : 20, width : 20)
    }
	
	def beforeInsert = {
		password = password.encodeAsSHA()
		def imageTool = new ImageTool()
		imageTool.load(avatar)
		imageTool.thumbnail(100)
		avatar = imageTool.getBytes("JPEG") 
	}
}
