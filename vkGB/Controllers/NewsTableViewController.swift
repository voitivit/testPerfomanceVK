

import UIKit

class NewsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GetNewsList().loadData { complition in
            DispatchQueue.main.async {
                self.postNewsList = complition
                self.tableView.reloadData()
            }
        }
    }
  
    var postNewsList: [PostNews] = []

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postNewsList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier: String
        
        if postNewsList[indexPath.row].textNews.isEmpty {
            identifier = "PhotoCell"
            //print(identifier)
        } else {
            identifier = "PostCell"
            //print(identifier)
        }
        
        let  cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! NewsTableViewCell
        //let  cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! NewsTableViewCell
        
        // аватар
        //cell.avatarUserNews.avatarImage.image = postNewsList[indexPath.row].avatar
        guard let avatarUrl = URL(string: postNewsList[indexPath.row].avatar ) else { return cell }
        cell.avatarUserNews.avatarImage.load(url: avatarUrl) // работает через extension UIImageView
        
        // имя автора
        cell.nameUserNews.text = postNewsList[indexPath.row].name
        
        // дата новости
        cell.dateNews.text = postNewsList[indexPath.row].date
        cell.dateNews.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.light)
        cell.dateNews.textColor = UIColor.gray.withAlphaComponent(0.5)
        
        if identifier == "PostCell" {
            cell.textNewPost.text = postNewsList[indexPath.row].textNews
        }
        
        //картинка к новости
        guard let imgUrl = URL(string: postNewsList[indexPath.row].imageNews ) else { return cell }
        cell.imgNews.load(url: imgUrl) // работает через extension UIImageView
        cell.imgNews.contentMode = .scaleAspectFill
        
        // лайки
        cell.likesCount.countLikes = postNewsList[indexPath.row].likes // значение для счетчика
        cell.likesCount.labelLikes.text = String(postNewsList[indexPath.row].likes) // вывод количества лайков
        
        // комментарии
        cell.commentsCount.setTitle(String(postNewsList[indexPath.row].comments), for: .normal)
        
        // репосты
        cell.repostsCount.setTitle(String(postNewsList[indexPath.row].reposts), for: .normal)
        
        // просмотры
        cell.viewsCount.setTitle(String(postNewsList[indexPath.row].views), for: .normal)
        

        return cell
    }

}
