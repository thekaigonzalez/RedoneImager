module native;

// Copyright (C) 2021 Kai D. Gonzalez
// 
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as
// published by the Free Software Foundation, either version 3 of the
// License, or (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
// 
// You should have received a copy of the GNU Affero General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

import fmt;
import img;
import std.stdio;
import std.array;

void main(string[] args) {
    if (args.length >= 2) {
        File o = File(args[1], "r");
        File output = File("out.v", "w");
        while (!o.eof()) {
            string line = o.readln();
            if (!(line.length > 0)) continue;
            else {
            Img_Tree itree = execute_img_code(line);
            if (itree.name.length == 0) continue; else {
            output.writeln(itree.name ~ "(" ~ join(itree.args, ",") ~ ")");
            }
            }
        }
        output.close();
    }
}