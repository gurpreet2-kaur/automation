from testrail import *
from pprint import *
import sys, getopt
import xml.dom.minidom
import ssl
import os
import fnmatch


def parse_uat_result(filename):
    cidstatus = {}

    filepath = 'D:/Git_Repo/qa/RF_Work_Folder_PyCharm/RMS_Web/Results/'+ filename
    xmldoc = xml.dom.minidom.parse(filepath)
    testlist = xmldoc.getElementsByTagName('test')
    for test in testlist:
        tags = test.getElementsByTagName('tag')
        for tag in tags:
            cid_str = tag.firstChild.nodeValue
            if cid_str[:4] == "CID:":
                cid = cid_str[4:]
                status = test.getElementsByTagName('status')
                cidstatus[cid] = '1' if status[-1].attributes['status'].value == "PASS" else '5'
    return cidstatus


def main():
    ssl._create_default_https_context = ssl._create_unverified_context
    resultxml = "robot_result.xml"
    projectid = "2"
    user = "sudhanshu.wadhwa@reviverauto.com"
    pwd = "ar1cenT%"
    folder = ""
    testrail_url = "https://revivermx.testrail.net"
    try:
        opts, args = getopt.getopt(sys.argv[1:], "", ["pid=", "folder=", "user=", "pwd=", "testrail="])
    except getopt.GetoptError as err:
        # print help information and exit:
        print str(err)  # will print something like "option -a not recognized"
        sys.exit(2)
    for o, a in opts:
        if o == "--folder":
            folder = a;
        elif o == "--pid":
            projectid = a;
        elif o == "--user":
            user = a;
        elif o == "--pwd":
            pwd = a;
        elif o == "--testrail":
            testrail_url = a;
        else:
            assert False, "Unknown option" + o

    print "User:" + user + ":" + pwd
    print "Project ID:" + str(projectid) + " TestRail URL:" + testrail_url
    client = APIClient(testrail_url)
    client.user = user
    client.password = pwd

    run = client.send_post('add_run/' + str(projectid), {"suite_id": 1, "name": "Test Execution Sprint 1a - Chrome", "assignedto_id": 6, "include_all": 1}) #, "case_ids":['563','564','565','566','567']})

    for root, dirs, files in os.walk('D:\Git_Repo\qa\RF_Work_Folder_PyCharm\RMS_Web\Results'):

        for file in files:
            print file
            if not fnmatch.fnmatch(file, 'output.xml'):
                continue
            #print file
            cidstatus = parse_uat_result(file)
            for cid in iter(cidstatus):
                #print file
                print "Updating test result for case:" + str(cid)
                ssl._create_default_https_context = ssl._create_unverified_context
                resultxml = "robot_result.xml"
                projectid = "2"
                user = "sudhanshu.wadhwa@reviverauto.com"
                pwd = "ar1cenT%"
                folder = ""
                testrail_url = "https://revivermx.testrail.net"
                try:
                    opts, args = getopt.getopt(sys.argv[1:], "", ["pid=", "folder=", "user=", "pwd=", "testrail="])
                except getopt.GetoptError as err:
                    # print help information and exit:
                    print str(err)  # will print something like "option -a not recognized"
                    sys.exit(2)
                for o, a in opts:
                    if o == "--folder":
                        folder = a;
                    elif o == "--pid":
                        projectid = a;
                    elif o == "--user":
                        user = a;
                    elif o == "--pwd":
                        pwd = a;
                    elif o == "--testrail":
                        testrail_url = a;
                    else:
                        assert False, "Unknown option" + o
                resp = client.send_post('add_result_for_case/' + str(run['id']) + '/' + str(cid),
                                        {"status_id": cidstatus[cid]})


            print(resp)
    print "Done!"


main();
