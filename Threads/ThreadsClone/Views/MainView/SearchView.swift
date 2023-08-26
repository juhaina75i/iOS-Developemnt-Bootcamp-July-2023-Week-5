
import SwiftUI

struct SearchView: View {
    @State var searched: String = ""
    var body: some View {
        
        VStack{
            HStack{
                Image(systemName: "magnifyingglass")
                TextField("search", text: $searched).frame(height: 40)
            }.frame(maxWidth: .infinity)
            .padding(.horizontal)
                .background(RoundedRectangle(cornerRadius: 12.5).fill(.gray.opacity(0.1))
                            
                )
                .padding()
            ScrollView{
                ForEach(0...20, id:\.self){ _ in
                    HStack(alignment: .top){
                        AsyncImage(url:URL(string:  "https://source.unsplash.com/50x50/?person")
                        ) {result in
                            if let image = result.image {
                                image.resizable()
                                    .scaledToFill()
                                    .clipShape(Circle())
                            } else {
                                ProgressView()
                            }
                        } .frame(width: 50, height: 50)
                        VStack(alignment: .leading){
                            Text("Username")
                            Text("Flawless")
                            Text("455 Followers")
                        }.frame(maxWidth: .infinity, alignment: .leading)
                        Button(action: {
                        }, label:{
                            Text("Follow")
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .background(RoundedRectangle(cornerRadius: 12.5).stroke(.gray.opacity(0.25)))
                        }).buttonStyle(.plain)
                    
                    }.padding(.horizontal)
                    Divider()
                }.padding(5)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
