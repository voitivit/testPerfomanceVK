
import UIKit

class NewsTableViewCell: UITableViewCell {
    


    @IBOutlet weak var avatarUserNews: AvatarsView!
    @IBOutlet weak var nameUserNews: UILabel!
    @IBOutlet weak var dateNews: UILabel!
    @IBOutlet weak var textNews: UILabel!
    
    @IBOutlet weak var imgNews: UIImageView!
    @IBOutlet weak var textNewPost: UITextView!
    @IBOutlet weak var commentsCount: UIButton!
    @IBOutlet weak var repostsCount: UIButton!
    @IBOutlet weak var viewsCount: UIButton!
    @IBOutlet weak var likesCount: LikeControl!
    
    
}
