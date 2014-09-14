import MySQLdb as mysql;
from db_cons import *;

def run(func):
    #con = mysql.connect(host='mysql.server', user='greelog', paswd='king_kong', db='greelog$one')
    con = mysql.connect('localhost', 'tuser', 'tpasw', 'tdb');
    with con:
        cur = con.cursor();
        ans = func(cur);
    return ans;


def insert_individual(fname, lname, iname, ihasw):
    def script(cur):
        cur.execute(INSERT_INDIVIDUAL, (fname, lname, iname, ihasw, 0));
    run(script);
def select_individual(iname):
    def script(cur):
        cur.execute(SELECT_INDIVIDUAL, (iname,));
        return cur.fetchone();
    return run(script);


def insert_organization(oname, ohasw):
    def script(cur):
        cur.execute(INSERT_ORGANIZATION, (oname, ohasw, 0));
    run(script);
def select_organization(oname):
    def script(cur):
        cur.execute(SELECT_ORGANIZATION, (oname,));
        return cur.fetchone();
    return run(script);


def insert_post(ind_org, author, title, body, date_x):
    def script(cur):
        cur.execute(INSERT_POST, (ind_org, author, title, body, date_x));
        return cur.lastrowid;
    return run(script);
def select_post(pid):
    def script(cur):
        cur.execute(SELECT_POST, (pid,));
        return cur.fetchone();
    return run(script);
def select_all_posts(author):
    def script(cur):
        cur.execute(SELECT_ALL_POSTS, (author,));
        return cur.fetchone();
    return run(script);
def update_post(pid, title, body, date_x):
    def scrit(cur):
        cur.execute(UPDATE_POST, (title, body, date_x, pid));
    run(script);
def delete_post(pid):
    def script(cur):
        cur.execute(DELETE_POST, (pid,));
    run(script);



def insert_event(oname, title, body, venue, date_s, date_e):
    def script(cur):
        cur.execute(INSERT_EVENT, (oname, title, body, venue, date_s, date_e));
        return cur.lastrowid;
    return run(script);
def update_event(eid, title, body, venue, date_s, date_e):
    def script(cur):
        cur.execute(UPDATE_EVENT, (title, body, venue, date_s, date_e, eid));
    run(script);
def select_event(eid):
    def script(cur):
        cur.execute(SELECT_EVENT, (eid,));
        return cur.fetchone();
    return run(script);
def select_all_events(oname):
    def script(cur):
        cur.execute(SELECT_ALL_EVENTS, (oname,));
        return cur.fetchall();
    return run(script);
def delete_event(tid):
    def script(cur):
        cur.execute(DELETE_EVENT, (tid,));
    run(script);


def insert_rsvp(eid, iname, ans):
    def script(cur):
        cur.execute(INSERT_RSVP, (eid, iname, ans));
    run(script);
def update_rsvp(eid, iname, ans):
    def script(cur):
        cur.execute(UPDATE_RSVP, (ans, eid, iname));
    run(script);
def select_rsvp(eid, iname):
    def script(cur):
        cur.execute(SELECT_RSVP, (eid, iname));
        return cur.fetchone();
    return run(script);


def insert_volunteer(oname, iname):
    def script(cur):
        cur.execute(INSERT_VOLUNTEER, (oname, iname));
    run(script);
def select_volunteers(oname):
    def script(cur):
        cur.execute(SELECT_VOLUNTEERS, (oname,));
        return cur.fetchall();
    return run(script);
def delete_volunteer(oname, iname):
    def script(cur):
        cur.execute(DELETE_VOLUNTEER, (oname, iname));
    run(script);


def restart():
    def script(cur):
        for i in [
            DROP_INDIVIDUALS,
            CREATE_INDIVIDUALS,
            DROP_ORGANIZATIONS,
            CREATE_ORGANIZATIONS,
            DROP_POSTS,
            CREATE_POSTS,
            DROP_POSTS,
            CREATE_POSTS,
            DROP_EVENTS,
            CREATE_EVENTS,
            DROP_RSVPS,
            CREATE_RSVPS,
            DROP_VOLUNTEERS,
            CREATE_VOLUNTEERS
        ]:
            #print i;
            cur.execute(i);
            #print;
    run(script);