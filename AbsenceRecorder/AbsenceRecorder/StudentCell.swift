//
//  StudentCell.swift
//  AbsenceRecorder
//
//  Created by Connolly, Patrick (IRG) on 07/02/2020.
//  Copyright © 2020 Connolly, Patrick (IRG). All rights reserved.
//

import UIKit

class StudentCell: UITableViewCell {


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.accessoryType = selected ? .checkmark : .none
        self.selectionStyle = .none
    }
    


}
