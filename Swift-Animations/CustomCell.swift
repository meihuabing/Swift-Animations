//
//  CustomCell.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/6.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

// MARK: extension UITableView

extension UITableView {
    
    /**
     Dequeue and load content from adapter.
     
     - parameter adapter:    The CellDataAdapter.
     - parameter indexPath:  The indexPath.
     - parameter tableView:  The TableView.
     - parameter controller: The controller.
     
     - returns: The CustomCell instance.
     */
    func dequeueCellAndLoadContentFromAdapter(adapter : CellDataAdapter, indexPath : NSIndexPath,
                                              tableView : UITableView? = nil, controller : UIViewController? = nil) -> CustomCell {
        
        let cell         = self.dequeueReusableCellWithIdentifier(adapter.cellReuseIdentifier!) as! CustomCell
        cell.indexPath   = indexPath
        cell.dataAdapter = adapter
        cell.data        = adapter.data
        cell.tableView   = tableView
        cell.controller  = controller
        cell.loadContent()
        
        return cell
    }
    
    func selectedEventWithIndexPath(indexPath : NSIndexPath) {
        
        let cell = self.cellForRowAtIndexPath(indexPath) as! CustomCell
        
        // Make sure the cell is kind of CustomCell.
        guard cell.isKindOfClass(CustomCell.classForCoder()) == true else {
            
            return
        }
        
        cell.selectedEvent()
    }
}

// MARK: protocol CustomCellDelegate

protocol CustomCellDelegate : class {
    
    /**
     CustomCell's event.
     
     - parameter cell:  CustomCell type class.
     - parameter event: Event data.
     */
    func customCell(cell: CustomCell?, event: AnyObject?)
}

// MARK: CustomCell

class CustomCell: UITableViewCell {
    
    weak var delegate    : CustomCellDelegate?
    weak var dataAdapter : CellDataAdapter?
    weak var data        : AnyObject?
    weak var indexPath   : NSIndexPath?
    weak var tableView   : UITableView?
    weak var controller  : UIViewController?
    var      display     : Bool?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupCell()
        self.buildSubview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     Setup cell, override by subclass.
     */
    func setupCell() {
        
        self.selectionStyle = .None
    }
    
    /**
     Build subview, override by subclass.
     */
    func buildSubview() {}
    
    /**
     Load content, override by subclass.
     */
    func loadContent() {}
    
    /**
     Selected event, you should use this method in 'tableView:didSelectRowAtIndexPath:' to make it effective.
     */
    func selectedEvent() {}
    
    /**
     Calculate the cell's from data, override by subclass.
     
     - parameter data: Data.
     
     - returns: Cell's height.
     */
    class func HeightWithData(data : AnyObject) -> CGFloat { return 0}
    
    /**
     Create the CustomCell type data adapter.
     
     - parameter reuseIdentifier: The reuseIdentifier.
     - parameter data:            The data.
     - parameter cellHeight:      The cell's height.
     - parameter type:            The cell's type.
     
     - returns: The cellDataAdapter.
     */
    class func Adapter(reuseIdentifier: String? = nil, data: AnyObject? = nil, cellHeight: CGFloat? = 0, type: Int? = nil) -> CellDataAdapter {
        
        let identifier = (reuseIdentifier == nil ? String(self.classForCoder()) : reuseIdentifier)
        
        return CellDataAdapter.init(cellReuseIdentifier: identifier, data: data, cellHeight: cellHeight, cellType: type)
    }
    
    /**
     Register cell to tableView with cell reuse identifier.
     
     - parameter tableView:           UITableView.
     - parameter cellReuseIdentifier: Cell reuse identifier.
     */
    class func RegisterTo(tableView: UITableView, cellReuseIdentifier: String? = nil) {
        
        tableView.registerClass(self.classForCoder(), forCellReuseIdentifier: (cellReuseIdentifier != nil) ? cellReuseIdentifier! : String(self.classForCoder()))
    }
    
    /**
     Update the cell's height with animated or not, before you use this method, you should have the weak reference 'tableView' and 'dataAdapter', and this method will update the weak reference dataAdapter's property cellHeight.
     
     - parameter height:   The new cell height.
     - parameter animated: Animated or not, default is true.
     */
    func updateWithNewCellHeight(height : CGFloat, animated : Bool = true) {
        
        guard tableView != nil && dataAdapter != nil else {
            
            return
        }
        
        if animated {
            
            dataAdapter?.cellHeight = height
            tableView?.beginUpdates()
            tableView?.endUpdates()
            
        } else {
            
            dataAdapter?.cellHeight = height
            tableView?.reloadData()
        }
    }
}

