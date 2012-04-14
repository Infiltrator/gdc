
import std.stdio;

template Tuple(A...)
{
    alias A Tuple;
}

template eval( A... )
{
    const typeof(A[0]) eval = A[0];
}

/************************************************/

int Foo1(int i)
{
    if (i == 0)
	return 1;
    else
	return i * Foo1(i - 1);
}

void test1()
{
    static int f = Foo1(5);
    printf("%d %d\n", f, 5*4*3*2);
    assert(f == 120);
}

/************************************************/

int find2(string s, char c)
{
    if (s.length == 0)
	return -1;
    else if (c == s[0])
	return 0;
    else
	return 1 + find2(s[1..$], c);
}

void test2()
{
    static int f = find2("hello", 'l');
    printf("%d\n", f);
    assert(f == 2);
}

/************************************************/

int bar3(int i)
{   int j;
    while (i)
    {	j += i;
	i--;
    }
    return j;
}

void test3()
{
    static b = bar3(7);
    printf("b = %d, %d\n", b, bar3(7));
    assert(b == 28);
}

/************************************************/

int bar4(int i)
{
    for (int j = 0; j < 10; j++)
	i += j;
    return i;
}

void test4()
{
    static b = bar4(7);
    printf("b = %d, %d\n", b, bar4(7));
    assert(b == 52);
}

/************************************************/

int bar5(int i)
{
    int j;
    do
    {
	i += j;
	j++;
    } while (j < 10);
    return i;
}

void test5()
{
    static b = bar5(7);
    printf("b = %d, %d\n", b, bar5(7));
    assert(b == 52);
}

/************************************************/

int bar6(int i)
{
    int j;
    do
    {
	i += j;
	j++;
	if (j == 4)
	    break;
    } while (j < 10);
    return i;
}

void test6()
{
    static b = bar6(7);
    printf("b = %d, %d\n", b, bar6(7));
    assert(b == 13);
}

/************************************************/

int bar7(int i)
{
    int j;
    do
    {
	i += j;
	j++;
	if (j == 4)
	    return 80;
    } while (j < 10);
    return i;
}

void test7()
{
    static b = bar7(7);
    printf("b = %d, %d\n", b, bar7(7));
    assert(b == 80);
}

/************************************************/

int bar8(int i)
{
    int j;
    do
    {
	j++;
	if (j == 4)
	    continue;
	i += j;
    } while (j < 10);
    return i;
}

void test8()
{
    static b = bar8(7);
    printf("b = %d, %d\n", b, bar8(7));
    assert(b == 58);
}

/************************************************/

int bar9(int i)
{
    int j;
    while (j < 10)
    {
	j++;
	if (j == 4)
	    continue;
	i += j;
    }
    return i;
}

void test9()
{
    static b = bar9(7);
    printf("b = %d, %d\n", b, bar9(7));
    assert(b == 58);
}

/************************************************/

int bar10(int i)
{
    int j;
    while (j < 10)
    {
	j++;
	if (j == 4)
	    break;
	i += j;
    }
    return i;
}

void test10()
{
    static b = bar10(7);
    printf("b = %d, %d\n", b, bar10(7));
    assert(b == 13);
}

/************************************************/

int bar11(int i)
{
    int j;
    while (j < 10)
    {
	j++;
	if (j == 4)
	    return i << 3;
	i += j;
    }
    return i;
}

void test11()
{
    static b = bar11(7);
    printf("b = %d, %d\n", b, bar11(7));
    assert(b == 104);
}

/************************************************/

int bar12(int i)
{
    for (int j; j < 10; j++)
    {
	if (j == 4)
	    return i << 3;
	i += j;
    }
    return i;
}

void test12()
{
    static b = bar12(7);
    printf("b = %d, %d\n", b, bar12(7));
    assert(b == 104);
}

/************************************************/

int bar13(int i)
{
    for (int j; j < 10; j++)
    {
	if (j == 4)
	    break;
	i += j;
    }
    return i;
}

void test13()
{
    static b = bar13(7);
    printf("b = %d, %d\n", b, bar13(7));
    assert(b == 13);
}

/************************************************/

int bar14(int i)
{
    for (int j; j < 10; j++)
    {
	if (j == 4)
	    continue;
	i += j;
    }
    return i;
}

void test14()
{
    static b = bar14(7);
    printf("b = %d, %d\n", b, bar14(7));
    assert(b == 48);
}

/************************************************/

int bar15(int i)
{
    foreach (k, v; "hello")
    {
	i <<= 1;
	if (k == 4)
	    continue;
	i += v;
    }
    return i;
}

void test15()
{
    static b = bar15(7);
    printf("b = %d, %d\n", b, bar15(7));
    assert(b == 3344);
}

/************************************************/

int bar16(int i)
{
    foreach_reverse (k, v; "hello")
    {
	i <<= 1;
	if (k == 4)
	    continue;
	i += v;
    }
    return i;
}

void test16()
{
    static b = bar16(7);
    printf("b = %d, %d\n", b, bar16(7));
    assert(b == 1826);
}

/************************************************/

int bar17(int i)
{
    foreach (k, v; "hello")
    {
	i <<= 1;
	if (k == 2)
	    break;
	i += v;
    }
    return i;
}

void test17()
{
    static b = bar17(7);
    printf("b = %d, %d\n", b, bar17(7));
    assert(b == 674);
}

/************************************************/

int bar18(int i)
{
    foreach_reverse (k, v; "hello")
    {
	i <<= 1;
	if (k == 2)
	    break;
	i += v;
    }
    return i;
}

void test18()
{
    static b = bar18(7);
    printf("b = %d, %d\n", b, bar18(7));
    assert(b == 716);
}

/************************************************/

int bar19(int i)
{
    assert(i > 0);
    foreach_reverse (k, v; "hello")
    {
	i <<= 1;
	if (k == 2)
	    return 8;
	i += v;
    }
    return i;
}

void test19()
{
    static b = bar19(7);
    printf("b = %d, %d\n", b, bar19(7));
    assert(b == 8);
}

/************************************************/

int bar20(int i)
{
    assert(i > 0);
    foreach (k, v; "hello")
    {
	i <<= 1;
	if (k == 2)
	    return 8;
	i += v;
    }
    return i;
}

void test20()
{
    static b = bar20(7);
    printf("b = %d, %d\n", b, bar20(7));
    assert(b == 8);
}

/************************************************/

int bar21(int i)
{
    assert(i > 0);
    foreach (v; Tuple!(57, 23, 8))
    {
	i <<= 1;
	i += v;
    }
    return i;
}

void test21()
{
    static b = bar21(7);
    printf("b = %d, %d\n", b, bar21(7));
    assert(b == 338);
}

/************************************************/

int bar22(int i)
{
    assert(i > 0);
    foreach_reverse (v; Tuple!(57, 23, 8))
    {
	i <<= 1;
	i += v;
    }
    return i;
}

void test22()
{
    static b = bar22(7);
    printf("b = %d, %d\n", b, bar22(7));
    assert(b == 191);
}

/************************************************/

int bar23(int i)
{
    assert(i > 0);
    foreach_reverse (v; Tuple!(57, 23, 8))
    {
	i <<= 1;
	if (v == 23)
	    return i + 1;
	i += v;
    }
    return i;
}

void test23()
{
    static b = bar23(7);
    printf("b = %d, %d\n", b, bar23(7));
    assert(b == 45);
}

/************************************************/

int bar24(int i)
{
    assert(i > 0);
    foreach (v; Tuple!(57, 23, 8))
    {
	i <<= 1;
	if (v == 23)
	    return i + 1;
	i += v;
    }
    return i;
}

void test24()
{
    static b = bar24(7);
    printf("b = %d, %d\n", b, bar24(7));
    assert(b == 143);
}

/************************************************/

int bar25(int i)
{
    assert(i > 0);
    foreach_reverse (v; Tuple!(57, 23, 8))
    {
	i <<= 1;
	if (v == 23)
	    break;
	i += v;
    }
    return i;
}

void test25()
{
    static b = bar25(7);
    printf("b = %d, %d\n", b, bar25(7));
    assert(b == 44);
}

/************************************************/

int bar26(int i)
{
    assert(i > 0);
    foreach (v; Tuple!(57, 23, 8))
    {
	i <<= 1;
	if (v == 23)
	    break;
	i += v;
    }
    return i;
}

void test26()
{
    static b = bar26(7);
    printf("b = %d, %d\n", b, bar26(7));
    assert(b == 142);
}

/************************************************/

int bar27(int i)
{
    foreach_reverse (v; Tuple!(57, 23, 8))
    {
	i <<= 1;
	if (v == 23)
	    continue;
	i += v;
    }
    return i;
}

void test27()
{
    static b = bar27(7);
    printf("b = %d, %d\n", b, bar27(7));
    assert(b == 145);
}

/************************************************/

int bar28(int i)
{
    foreach (v; Tuple!(57, 23, 8))
    {
	i <<= 1;
	if (v == 23)
	    continue;
	i += v;
    }
    return i;
}

void test28()
{
    static b = bar28(7);
    printf("b = %d, %d\n", b, bar28(7));
    assert(b == 292);
}

/************************************************/

int bar29(int i)
{
    switch (i)
    {
	case 1:
	    i = 4;
	    break;
	case 7:
	    i = 3;
	    break;
	default: assert(0);
    }
    return i;
}

void test29()
{
    static b = bar29(7);
    printf("b = %d, %d\n", b, bar29(7));
    assert(b == 3);
}

/************************************************/

int bar30(int i)
{
    switch (i)
    {
	case 1:
	    i = 4;
	    break;
	case 8:
	    i = 2;
	    break;
	default:
	    i = 3;
	    break;
    }
    return i;
}

void test30()
{
    static b = bar30(7);
    printf("b = %d, %d\n", b, bar30(7));
    assert(b == 3);
}

/************************************************/

int bar31(string s)
{   int i;

    switch (s)
    {
	case "hello":
	    i = 4;
	    break;
	case "betty":
	    i = 2;
	    break;
	default:
	    i = 3;
	    break;
    }
    return i;
}

void test31()
{
    static b = bar31("betty");
    printf("b = %d, %d\n", b, bar31("betty"));
    assert(b == 2);
}

/************************************************/

int bar32(int i)
{
    switch (i)
    {
	case 7:
	    i = 4;
	    goto case;
	case 5:
	    i = 2;
	    break;
	default:
	    i = 3;
	    break;
    }
    return i;
}

void test32()
{
    static b = bar32(7);
    printf("b = %d, %d\n", b, bar32(7));
    assert(b == 2);
}

/************************************************/

int bar33(int i)
{
    switch (i)
    {
	case 5:
	    i = 2;
	    break;
	case 7:
	    i = 4;
	    goto case 5;
	default:
	    i = 3;
	    break;
    }
    return i;
}

void test33()
{
    static b = bar33(7);
    printf("b = %d, %d\n", b, bar33(7));
    assert(b == 2);
}

/************************************************/

int bar34(int i)
{
    switch (i)
    {
	default:
	    i = 3;
	    break;
	case 5:
	    i = 2;
	    break;
	case 7:
	    i = 4;
	    goto default;
    }
    return i;
}

void test34()
{
    static b = bar34(7);
    printf("b = %d, %d\n", b, bar34(7));
    assert(b == 3);
}

/************************************************/

int bar35(int i)
{
  L1:
    switch (i)
    {
	default:
	    i = 3;
	    break;
	case 5:
	    i = 2;
	    break;
	case 3:
	    return 8;
	case 7:
	    i = 4;
	    goto default;
    }
    goto L1;
}

void test35()
{
    static b = bar35(7);
    printf("b = %d, %d\n", b, bar35(7));
    assert(b == 8);
}

/************************************************/

int square36(int x)
{
   return x * x;
}

const int foo36 = square36(5); 

void test36()
{
    assert(foo36 == 25);
}

/************************************************/

string someCompileTimeFunction()
{
    return "writefln(\"Wowza!\");";
}

void test37()
{
    mixin(someCompileTimeFunction());
} 

/************************************************/

string NReps(string x, int n)
{
    string ret = "";
    for(int i=0; i<n; i++) { ret ~= x; }
    return ret;
}

void test38()
{
    static x = NReps("3", 6);
    assert(x == "333333");
} 

/************************************************/

bool func39() { return true; }

static if (func39()) {
pragma(msg, "true" );
} else {
pragma(msg, "false" ); 
}

void test39()
{
}

/************************************************/

string UpToSpace(string x)
{
    int i=0;
    while (i<x.length && x[i] != ' ') {
        i++;
    }
    return x[0..i];
}

void test40()
{
    const y = UpToSpace("first space was after first");
    writeln(y);
    assert(y == "first");
}

/************************************************/

int bar41(ref int j)
{
    return 5;
}

int foo41(int i)
{
    int x;
    x = 3;
    bar41(x);
    return i + x;
}

void test41()
{
    const y = foo41(3);
    writeln(y);
    assert(y == 6);
}

/************************************************/

int bar42(ref int j)
{
    return 5;
}

int foo42(int i)
{
    int x;
    x = 3;
    bar42(x);
    return i + x;
}

void test42()
{
    const y = foo42(3);
    writeln(y);
    assert(y == 6);
}

/************************************************/

int bar(string A)
{
    int v;

    for (int i = 0; i < A.length; i++)
    {
        if (A[i] != ' ')
	{
            v += A.length;
        }
    }

    return v;
}

void test43()
{
    const int foo = bar("a b c d");
    writeln(foo);
    assert(foo == 28);
}

/************************************************/

string foo44() { return( "bar" ); }

void test44()
{
    const string bar = foo44();
    assert(bar == "bar");
}

/************************************************/

int square45( int n ) { return( n * n ); }

void test45()
{
    int bar = eval!( square45(5) );
    assert(bar == 25);
}

/************************************************/

const int foo46[5] = [0,1,2,3,4];

void test46()
{
        writeln(eval!(foo46[3]));
}

/************************************************/

string foo47()
{
  string s;
  s = s ~ 't';
  return s ~ "foo";
}

void test47()
{
    static const x = foo47();
    pragma(msg, x);
    assert(x == "tfoo");
}

/************************************************/

string foo48()
{
  string s;
  s = s ~ 't';
  s = s.idup;
  return s ~ "foo";
}

void test48()
{
    static const x = foo48();
    pragma(msg, x);
    assert(x == "tfoo");
}

/************************************************/

dstring testd49( dstring input )
{
    if( input[3..5] != "rt" )
    {
        return input[1..3];
    }
    return "my";
}

void test49()
{
    static x = testd49("hello");
    writeln(x);
    assert(x == "el");
}

/************************************************/

string makePostfix50(int x)
{
    string first;
    first = "bad";
    if (x)
    {
        first = "ok";
        makePostfix50(0);
    }
    return first;
}


void test50()
{
    static const char [] q2 = makePostfix50(1);
    static assert(q2=="ok", q2);
}

/************************************************/

int exprLength(string s)
{
    int numParens=0;
    for (int i=0; i<s.length; ++i) {
        if (s[i]=='(') { numParens++; }
        if (s[i]==')') { numParens--; }
        if (numParens == 0) { return i; }
    }
    assert(0);
}

string makePostfix51(string operations)
{
    if (operations.length<2) return "x";
    int x = exprLength(operations);
    string first="bad";
    if (x>0) {
        first = "ok";
        string ignore = makePostfix51(operations[1..x]);
    }
    return first;
}


void test51()
{
    string q = makePostfix51("(a+b)*c");
    assert(q=="ok");
    static const string q2 = makePostfix51("(a+b)*c");
    static assert(q2=="ok");
    static assert(makePostfix51("(a+b)*c")=="ok");
}

/************************************************/

int foo52(ref int x)
{
    x = 7;
    return 3;
}

int bar52(int y)
{
    y = 4;
    foo52(y);
    return y;
}

void test52()
{
    printf("%d\n", bar52(2));
    static assert(bar52(2) == 7);
}

/************************************************/

void bar53(out int x) { x = 2; }

int foo53() { int y; bar53(y); return y; }

void test53()
{
    const int z = foo53();
    assert(z == 2);
}

/************************************************/

void test54()
{
    static assert(equals54("alphabet", "alphabet"));
}

bool equals54(string a, string b)
{
    return (a == b);
}

/************************************************/

const string foo55[2] = ["a","b"];
string retsth55(int i) { return foo55[i]; }

void test55()
{
        writeln(eval!(foo55[0]));
        writeln(eval!(retsth55(0)));
}

/************************************************/

string retsth56(int i)
{
	static const string foo[2] = ["a","b"];
        return foo[i];
}

void test56()
{
        writeln(eval!(retsth56(0)));
}

/************************************************/


int g57()
{
    pragma(msg, "g");
    return 2;
}

const int a57 = g57();

void test57()
{
    assert(a57 == 2);
}

/************************************************/

int[] Fun58(int x)
{
  int[] result;
  result ~= x + 1;
  return result;
}

void test58()
{
    static b = Fun58(1) ~ Fun58(2);
    assert(b.length == 2);
    assert(b[0] == 2);
    assert(b[1] == 3);
    writeln(b);
}

/************************************************/

int Index59()
{
    int[] data = [1];
    return data[0];
}

void test59()
{
    static assert(Index59() == 1);
}

/************************************************/

string[int] foo60()
{
    return [3:"hello", 4:"betty"];
}

void test60()
{
    static assert(foo60()[3] == "hello");
    static assert(foo60()[4] == "betty");
}

/************************************************/

string[int] foo61()
{
    return [3:"hello", 4:"betty", 3:"world"];
}

void test61()
{
    static assert(foo61()[3] == "world");
    static assert(foo61()[4] == "betty");
}

/************************************************/

string foo62(int k)
{
    string[int] aa;
    aa = [3:"hello", 4:"betty"];
    return aa[k];
}

void test62()
{
    static assert(foo62(3) == "hello");
    static assert(foo62(4) == "betty");
}

/************************************************/

void test63()
{
        static auto x = foo63();
}

int foo63()
{
        pragma(msg, "Crash!");
        return 2;
}

/************************************************/

dstring testd64( dstring input )
{
        debug int x = 10;
        return "my";
}

void test64()
{   
        static x = testd64( "hello" );
}

/************************************************/

struct S65
{
    int i;
    int j = 3;
}

int foo(S65 s1, S65 s2)
{
    return s1 == s2;
}

void test65()
{
    static assert(foo( S65(1,5), S65(1,5) ) == 1);
    static assert(foo( S65(1,5), S65(1,4) ) == 0);
}

/************************************************/

struct S66
{
    int i;
    int j = 3;
}

int foo66(S66 s1)
{
    return s1.j;
}

void test66()
{
    static assert(foo66( S66(1,5) ) == 5);
}

/************************************************/

struct S67
{
    int i;
    int j = 3;
}

int foo67(S67 s1)
{
    s1.j = 3;
    int i = (s1.j += 2);
    assert(i == 5);
    return s1.j + 4;
}

void test67()
{
    static assert(foo67( S67(1,5) ) == 9);
}

/************************************************/

int foo68(int[] a)
{
    a[1] = 3;
    int x = (a[0] += 7);
    assert(x == 8);
    return a[0] + a[1];
}

void test68()
{
    static assert(foo68( [1,5] ) == 11);
}

/************************************************/

int foo69(char[] a)
{
    a[1] = 'c';
    char x = (a[0] += 7);
    assert(x == 'h');
    assert(x == a[0]);
    return a[0] + a[1] - 'a';
}

void test69()
{
    static assert(foo69( ['a','b'] ) == 'j');
}

/************************************************/

int foo70(int[ string ] a)
{
    a["world"] = 5;
    auto x = (a["hello"] += 7);
    assert(x == 10);
    assert(x == a["hello"]);
    return a["hello"] + a["betty"] + a["world"];
}

void test70()
{
    static assert(foo70( ["hello":3, "betty":4] ) == 19);
}

/************************************************/

size_t foo71(int[ string ] a)
{
    return a.length;
}

void test71()
{
    static assert(foo71( ["hello":3, "betty":4] ) == 2);
}

/************************************************/

string[] foo72(int[ string ] a)
{
    return a.keys;
}

void test72()
{
    static assert(foo72( ["hello":3, "betty":4] ) == ["hello", "betty"]);
}

/************************************************/

int[] foo73(int[ string ] a)
{
    return a.values;
}

void test73()
{
    static assert(foo73( ["hello":3, "betty":4] ) == [3, 4]);
}

/************************************************/

bool b74()
{
    string a = "abc";
    return (a[$-1]=='c');
}

const c74 = b74();

void test74()
{
    assert(c74 == true);
}

/************************************************/

struct FormatSpec {
  uint leading;
  bool skip;
  uint width;
  char modifier;
  char format;
  uint formatStart;
  uint formatLength;
  uint length;
}

FormatSpec GetFormat(string s) {
  FormatSpec result;
  return result;
}

FormatSpec GetFormat2(string s)
{
  FormatSpec result = FormatSpec();
  result.length = 0;
  assert(result.length < s.length);
  while (result.length < s.length)
  {
    ++result.length;
  }
  return result;
}

void test75()
{
    static FormatSpec spec = GetFormat("asd");

    assert(spec.leading == 0);
    assert(spec.modifier == char.init);

    static FormatSpec spec2 = GetFormat2("asd");
    assert(spec2.length == 3);
}

/************************************************/

int f76()
{
        int[3] a = void;
        a[0] = 1;
	assert(a[0] == 1);
        return 1;
}

const i76 = f76();

void test76()
{
}

/************************************************/

struct V77 {
    int a;
    int b;
}

V77 f77()
{
    int q = 0;
    int unused;
    int unused2;
    return V77(q, 0);
}

void test77()
{
    const w = f77();
    const v = f77().b;
}

/************************************************/

struct Bar78
{
    int x;
}

int foo78()
{
    Bar78 b = Bar78.init;
    Bar78 c;
    b.x = 1;
    b = bar(b);
    return b.x;
}

Bar78 bar(Bar78 b)
{
    return b;
}

void test78()
{
    static x = foo78();
}

/************************************************/

struct Bar79
{
    int y,x;
}

int foo79()
{
    Bar79 b = Bar79.init;

    b.x = 100;

    for (size_t i = 0; i < b.x; i++) { }

    b.x++;
    b.x = b.x + 1;

    return b.x;
}

void test79()
{
    static x = foo79();
    printf("x = %d\n", x);
    assert(x == 102);
}

/************************************************/

void test80()
{
}

/************************************************/

string foo81()
{
    return "";
}

string rod81(string[] a)
{
    return a[0];
}

void test81()
{
    static x = rod81([foo81(), ""]);
    assert(x == "");
}


/************************************************/

struct S82
{
        string name;
}

const S82 item82 = {"item"};

string mixItemList82()
{
        return item82.name;
}

const string s82 = mixItemList82();

void test82()
{
    assert(s82 == "item");
}

/************************************************/

struct S83
{
        string name;
}

const S83[] items83 = 
[
        {"item"},
];

string mixItemList83()
{
        string s;
        foreach(item;items83)
                s ~= item.name;
        return s;
}

const string s83 = mixItemList83();

void test83()
{
    writeln(s83);
    assert(s83 == "item");
}

/************************************************/

struct S84 { int a; }

int func84()
{
    S84 [] s = [S84(7)];
    return s[0].a; // Error: cannot evaluate func() at compile time
}

void test84()
{
    const int x = func84();
    assert(x == 7);
}

/************************************************/

struct S85 {
    int a;
}

size_t func85()
{
    S85 [] s;
    s ~= S85(7);
    return s.length;
}

void test85()
{
    const size_t x = func85();
    assert(x == 1);
}

/************************************************/

struct Bar86
{
    int x;
    char[] s;
}

char[] foo86()
{
    Bar86 bar;
    return bar.s;
}

void test86()
{
    static x = foo86();
    assert(x == null);
}  

/************************************************/

struct Bar87
{
    int x;
}

int foo87()
{
    Bar87 bar;
    bar.x += 1;
    bar.x++;
    return bar.x;
}

void test87()
{
    static x = foo87();
    assert(x == 2);
}

/************************************************/

int foo88()
{
    char[] s;
    int i;

    if (s)
    {
	i |= 1;
    }

    if (s == null)
    {
	i |= 2;
    }

    if (s is null)
    {
	i |= 4;
    }

    if (s == "")
    {
	i |= 8;
    }

    if (s.length)
    {
	i |= 16;
    }

    if (s == ['c'][0..0])
    {
	i |= 32;
    }


    if (null == s)
    {
	i |= 64;
    }

    if (null is s)
    {
	i |= 128;
    }

    if ("" == s)
    {
	i |= 256;
    }

    if (['c'][0..0] == s)
    {
	i |= 512;
    }

    return i;
}

void test88()
{
        static x = foo88();
	printf("x = %x\n", x);
	assert(x == (2|4|8|32|64|128|256|512));
}

/************************************************/

template Tuple89(T...)
{
        alias T val;
}

alias Tuple89!(int) Tup89;

string gen89()
{
    foreach (i, type; Tup89.val)
    {
	assert(i == 0);
	assert(is(type == int));
    }
    return null;
}

void test89()
{
    static const string text = gen89();
    assert(text is null);
}

/************************************************/

string bar90(string z)
{
    return z;
}

string foo90(string a, string b)
{
    string f = a.length==1 ? a: foo90("B", "C");
    string g = b.length==1 ? b: bar90(foo90("YYY", "A"));
    return  f;
}

void test90()
{
    static const string xxx = foo90("A", "xxx");
    printf("%.*s\n", xxx.length, xxx.ptr);
    assert(xxx == "A");
}

/************************************************/

struct PR91
{
}

int foo91()
{
        PR91 pr;
        pr = PR91();
        return 0;
}

void test91()
{
    static const i = foo91();
}

/************************************************/

char find92( immutable(char)[7] buf )
{
    return buf[3];
}


void test92()
{
    static const pos = find92( "abcdefg" );
    assert(pos == 'd');
}

/************************************************/

static string hello93()
{
        string result="";
	int i = 0;
        for(;;)
	{
           result ~= `abc`;
	   i += 1;
	   if (i == 3)
		break;
	}
        return result;
}

void test93()
{
	static string s = hello93();
	assert(s == "abcabcabc");
}

/************************************************/

int foo94 (string [] list, string s)
{
    if (list.length == 0)
	return 1;
    else
    {
	return 2 + foo94 (list [1..$], list [0]);
    }
}

void test94()
{
    printf("test94\n");
    static const int x = foo94 (["a","b"], "");
    assert(x == 5);
}

/************************************************/

char [] func95(immutable char[] s)
{
    char [] u = "".dup;
    u ~= s;
    u = u ~ s;
    return u;    
}

void test95()
{
    mixin(func95(";"));
}

/************************************************/

char [] func96(string s)
{
    char [] u = "".dup;
    u ~= s;
    u = u ~ s;
    return u;    
}

void test96()
{
    mixin(func96(";"));
}

/************************************************/

string foo97()
{
   string a;
   a ~="abc"; // ok
   string[] b;
   b ~= "abc"; // ok
   string[][] c;
   c ~= ["abc", "def"];
   string[][] d = [];
   d ~= ["abc", "def"]; // ok
   return "abc";   
}

void test97()
{
    static const xx97 = foo97();
}

/************************************************/

immutable(int)[] foo98(immutable(int)[][] ss)
{
    immutable(int)[] r;
    r ~= ss[0]; // problem here
    return r;
}

void test98()
{
    const r = foo98([[1], [2]]);
}

/************************************************/

struct Number
{
    public int value;
    static Number opCall(int value){
        Number n = void;
        n.value = value;
        return n;
    }
}

class Crash
{
    Number number = Number(0);
}

void test99()
{
}

/************************************************/

int[] map100 = ([ 4:true, 5:true ]).keys;
bool[] foo100 = ([ 4:true, 5:true ]).values;

void test100()
{
}

/************************************************/

int foo101()
{
    immutable bool [int] map = [ 4:true, 5:true ];
    foreach (x; map.keys) {}
    return 3;
}

static int x101 = foo101();

void test101()
{
}

/************************************************/

int foo102()
{
    foreach (i; 0 .. 1)
        return 1;
    return 0;
}
static assert(foo102() == 1);


int bar102()
{
    foreach_reverse (i; 0 .. 1)
        return 1;
    return 0;
}
static assert(bar102() == 1);

void test102()
{
}

/************************************************/

int foo103()
{
    foreach (c; '0' .. '9') {  }
    foreach_reverse (c; '9' .. '0') {  }
    return 0;
}

enum x103 = foo103();

void test103()
{
}

/************************************************/

struct S {
    int x;
    char y;
}

// Functions which should fail CTFE

int badfoo(){
   S[2] c;
   int w = 4;
   c[w].x=6;  // array bounds error
   return 7;
}

int badglobal = 1;

int badfoo3(){
   S[2] c;
   c[badglobal].x=6;  // global index error
   return 7;
}

int badfoo4(){
   static S[2] c;
   c[0].x=6;  // Cannot access static
   return 7;
}

/+ // This doesn't compile at runtime
int badfoo5(){
   S[] c = void;
   c[0].x=6;  // c is uninitialized, and not a static array.
   return 1;
}
+/

int badfoo6()
{
    S[] b = [S(7), S(15), S(56), S(12)];
    b[-2..4] = S(17); // exceeding (negative) array bounds
    return 1;
}

int badfoo7()
{
    S[] b = [S(7), S(15), S(56), S(12), S(67)];
    b[1..4] = [S(17), S(4)]; // slice mismatch in dynamic array
    return 1;
}

int badfoo8()
{
    S[] b; 
    b[1..3] = [S(17), S(4)]; // slice assign to uninitialized dynamic array
    return 1;
}


template Compileable(int z) { bool OK=true;}
static assert(!is(typeof(Compileable!(badfoo()).OK)));
static assert(!is(typeof(Compileable!(
(){
   S[] c;
   return c[7].x;  // uninitialized error
}()).OK
)));
static assert(is(typeof(Compileable!(0).OK)));
static assert(!is(typeof(Compileable!(badfoo3()).OK)));
static assert(!is(typeof(Compileable!(badfoo4()).OK)));
//static assert(!is(typeof(Compileable!(badfoo5()).OK)));
static assert(!is(typeof(Compileable!(badfoo6()).OK)));
static assert(!is(typeof(Compileable!(badfoo7()).OK)));
static assert(!is(typeof(Compileable!(badfoo8()).OK)));

// Functions which should pass CTFE

int goodfoo1()
{
   int[8] w;    // use static array in CTFE
   w[]=7;       // full slice assign
   w[$-1]=538;  // use of $ in index assignment
   assert(w[6]==7);
   return w[7];
}
static assert(goodfoo1()==538);

int goodfoo2()
{
   S[4] w = S(101);  // Block-initialize array of structs
   w[$-2].x = 917; // use $ in index member assignment
   w[$-2].y = 58; // this must not clobber the prev assignment
   return w[2].x; // check we got the correct one
}
static assert(goodfoo2()==917);

static assert(is(typeof(Compileable!(
(){
   S[4] w = void; // uninitialized array of structs
   w[$-2].x = 217; // initialize one member
   return w[2].x;
}()).OK
)));

int goodfoo4()
{
   S[4] b = [S(7), S(15), S(56), S(12)]; // assign from array literal
   assert(b[3]==S(12));
   return b[2].x-55;
}
static assert(goodfoo4()==1);

int goodfoo5()
{
    S[4] b = [S(7), S(15), S(56), S(12)];
    b[0..2] = [S(2),S(6)]; // slice assignment from array literal
    assert(b[3]==S(12));
    assert(b[1]==S(6));
    return b[0].x;
}
static assert(goodfoo5()==2);
static assert(goodfoo5()==2); // check for memory corruption

int goodfoo6()
{
    S[6] b = void; 
    b[2..5] = [S(2),S(6), S(17)]; // slice assign to uninitialized var
    assert(b[4]==S(17));
    return b[3].x;
}
static assert(goodfoo6()==6);

int goodfoo7()
{
    S[8] b = void; 
    b[2..5] = S(217); // slice assign to uninitialized var
    assert(b[4]==S(217));
    return b[3].x;
}
static assert(goodfoo7()==217);

int goodfoo8()
{
    S[] b = [S(7), S(15), S(56), S(12), S(67)];
    b[2..4] = S(17); // dynamic array block slice assign
    assert(b[3]==S(17));
    assert(b[4]==S(67));
    return b[0].x;
}
static assert(goodfoo8()==7);

// --------- CTFE MEMBER FUNCTION TESTS --------
struct Q {
   int x;
   char y;
   int opAddAssign(int w) { x+=w; return x+w; }
   Q opSubAssign(int w) { x-=w; 
   version(D_Version2) { mixin("return this;"); } else { mixin("return *this;"); }
   }
  int boo()  {return 4; }
  int coo()  { return x; }
  int foo()  { return coo(); }
  int doo(int a)  {
     Q z = Q(a, 'x');     
     z.x +=5;
     return z.coo() + 3*x;
  }
  void goo(int z) { x=z; }
  int hoo(int y, int z) { return y+z; }
  void joo(int z) {
      x+=z;
  }
}

int memtest1()
{
  Q b = Q(15, 'a');
  return b.hoo(3, 16);  // simple const function
}

static assert(memtest1()==19);

int memtest2()
{
  Q b = Q(15, 'x');
  b.x -=10;
  return b.coo();  
}

static assert(memtest2()==5);

int memtest3()
{
  Q b = Q(15, 'x');
  b.x -=10;
  return b.foo();  
}

static assert(memtest3()==5);

int memtest4()
{
  Q b = Q(12, 'x');
  return b.doo(514);  
}
static assert(memtest4()==519+3*12);


int memtest5()
{
  Q b = Q(132, 'x');
  b.goo(4178);   // Call modifying member
  return b.x;  
}
static assert(memtest5()==4178);

int memtest6()
{
   Q q = Q(1);
   q+=3;    // operator overloading   
   return q.x;
}
static assert(memtest6()==4);

static assert(!is(typeof(Compileable!(Q+=2).OK))); // Mustn't cause segfault

int memtest7()
{
   Q q = Q(57);
   q-=35;
   return q.x;
}

static assert(memtest7()==57-35);

int memtest8()
{
   Q[3] w;
   w[2].x = 17;
   w[2].joo(6); // Modify member of array
   w[1].x +=18;
   return w[2].coo();
}

static assert(memtest8()==6+17);

// --------- CTFE REF PASSING TESTS --------

// Bugzilla 1950 - CTFE doesn't work correctly for structs passed by ref
struct S1950{
    int x;
}

int foo1950(){
    S1950 s=S1950(5); // explicitly initialized
    bar1950(s);
    return s.x;
}

void bar1950(ref S1950 w){
    w.x = 10;
}

static assert(foo1950() == 10); // Fails, x is 0

int foo1950b(){
    S1950 s;  // uninitialized
    bar1950(s);
    return s.x;
}

static assert(foo1950b() == 10); // Fails, x is 0


// More extreme case, related to 1950

void bar1950c(ref int w){
  w= 87;
}

int foo1950c(){
    int[5] x;
    x[]=56;
    bar1950c(x[1]); // Non-trivial ref parameters
    return x[1];
}

static assert(foo1950c()==87);

void bar1950d(ref int[] w){
  w[1..$]= 87;
  w[0]+=15;
}

int foo1950d(){
    int[] x= [1,2,3,4,5];
    x[1..$]=56;
    bar1950d(x); // Non-trivial ref parameters
    assert(x[0]==16);
    return x[1];
}

static assert(foo1950d()==87);

// Nested functions
int nested(int x)
{
   int y = 3;
   int inner(int w) { int z=2; ++z; y += w; return x+3; }
   
   int z = inner(14);
   assert(y==17);
   inner(8);
   assert(y==17+8);
   return z + y;
}

static assert(nested(7)==17+8+10);
static assert(nested(7)==17+8+10);

// Recursive nested functions

int nested2(int x)
{
   int y = 3;
   int inner(int w) { int z=2; ++z; ++y; if (w<=1) return x+3; else return inner(w-1); }
   
   int z = inner(14);
   assert(y==17);
   
   inner(8);
   assert(y==17+8);
   return z + y;
}

static assert(nested2(7)==17+8+10);

// 1605 D1 & D2. break in switch with goto breaks in ctfe
int bug1605()
{
    int i = 0;
    while (true){
        goto LABEL;
        LABEL:
        if (i!=0) return i;
        i = 27;
    }
    assert(i==27);
    return 88; // unreachable
}

static assert(bug1605() == 27);

// 2564. D2 only. CTFE: the index in a tuple foreach is uninitialized (bogus error) 
// NOTE: Beware of optimizer bug 3264.

int bug2564()
{
    version(D_Version2) { mixin("enum int Q=0;"); }else {mixin("int Q=0;"); }
    string [2] s = ["a", "b"];    
    assert(s[Q].dup=="a");
    return 0;
}

static int bug2564b = bug2564();


// 1461 D1 + D2. Local variable as template alias parameter breaks CTFE
void bug1461(){
    int x;
    static assert( Gen1461!(x).generate() == null);
}

template Gen1461(alias A){
    string generate() {
        return null;
    }
}

/************************************************/

string foo104 (string [] a...)
{
    string result = "";
    foreach (s; a)
        result ~= s;
    return result;
}

mixin (foo104 ("int ", "x;"));

/************************************************/

struct SwineFlu {
   int a; int b;
}

struct Infection {
    SwineFlu y;
}

struct IveGotSwineFlu {
   Infection x;
   int z;
   int oink() { return x.y.a+10; }   
}

int quarantine() {
   IveGotSwineFlu d;
   return d.oink();
}

struct Mexico {
  Infection x;
  int z=2;
  int oink() { return z+x.y.b; }
}

int mediafrenzy() {
  Mexico m;
  return m.oink;
}

static assert( quarantine() == 10);
static assert( mediafrenzy() == 2);

/************************************************/

int ctfeArrayTest(int z)
{
    int[] a = new int[z];
    a[$ - 3] = 6;
    assert(a.length==z);
    return a[$ - 3];
}
static assert(ctfeArrayTest(15)==6);

/************************************************/

char bugzilla1298()
{
    char [4] q = "abcd".dup;
    char [4] r = ['a', 'b', 'c', 'd'];
    assert(q==r);
    q[0..2]="xy";
    q[2]+=3;
    return q[2];
}

static assert(bugzilla1298()=='f');

int bugzilla1790(Types...)() {
    foreach(T; Types) {
        ;
    }
    return 0;
}

const int bugs1790 = bugzilla1790!("")();

char ctfeStrTest1()
{
   char [8] s = void;
   s[2..4]='x';

   assert(s.length==8);
   return s[3];
}

static assert(ctfeStrTest1()=='x');

//--------- DELEGATE TESTS ------

// Function + delegate literals inside CTFE
int delegtest1()
{
    assert( function int(int a){ return 7+a; }(16)==23);
    return delegate int(int a){ return 7+a; }(6);
}

int delegtest2()
{
   int innerfunc1() {
        return delegate int(int a){ return 7+a; }(6);
   }
   int delegate() f = & innerfunc1;
   return 3*f();
}

int delegtest3()
{
   int function() f = & delegtest1;
   return 3*f();
}

struct DelegStruct
{
   int a;
   int bar(int x) { return a+x; }
}

int delegtest4()
{
   DelegStruct s;
   s.a= 5;
   auto f = &s.bar;
   return f(3);
}

alias int delegate(int) DelegType;

// Test arrays of delegates
int delegtest5()
{
   DelegStruct s;
   s.a= 5;
   DelegType[4] w;
   w[]= & s.bar;
   return w[2](3);
}

// Test arrays of structs of delegates
struct FoolishStruct {
   DelegType z;
}

int delegtest6()
{
   DelegStruct s;
   s.a= 5;
   FoolishStruct k[3];
   DelegType u = &s.bar;
   k[1].z= u;
   return k[1].z(3);
}

static assert(delegtest1()==13);
static assert(delegtest2()==39);
static assert(delegtest3()==39);
static assert(delegtest4()==8);
static assert(delegtest5()==8);
static assert(delegtest6()==8);

// Function + delegate literals, module scope
static assert(function int(int a){ return 17+a; }(16) == 33);
static assert((int a){ return 7+a; }(16) == 23);

// --- Test lazy ---
int lazyTest1(lazy int y)
{
    return y+1;
}

int lazyTest2(int x)
{
  return lazyTest1(x);
}

static assert(lazyTest1(7)==8);
static assert(lazyTest2(17)==18);

/************************************************/

version(D_Version2) {
// Bug 4020 and 4027 are D2 only

struct PostblitCrash {
    int x;
mixin("    this(this) { ++x; }");
}

int bug4020() {
    PostblitCrash f;
    f.x = 3;
    f = f;
    f = f;
    return f.x;
}
static assert(bug4020()==5);

string delegate() bug4027(string s)
{
    return { return s; };
}

// If it compiles, it must not generate wrong code on D2.
static if (is(typeof((){static const s = bug4027("aaa")(); }()))) {
    static assert(bug4027("aaa")() == "aaa");
    static assert(bug4027("bbb")() == "bbb");
}
}

// ---

void bug4004a(ref int a) {
    assert(a==7);
    a+=3;
}

void bug4004b(ref int b) {
    b= 7;
    bug4004a(b);
}

int bug4004c() {
    int offset = 5;
    bug4004b(offset);
    return offset;
}

static assert(bug4004c()==10);

// ---

int bug4019() {
    int[int] aa;
    aa[1] = 2;
    aa[4] = 6;
    return aa[1] + aa[4];
}
static assert(bug4019() == 8);

// ---

string delegate() bug4029a() {
    return { return "abc"[]; };
}

string bug4029() {
   return bug4029a()();
}

static assert(bug4029()=="abc");

/************************************************/

int bug4078() {
    int[] arr = new int[1];
    return arr[0];
}
static assert(bug4078() == 0);

int bug4052() {
    int[] arr = new int[1];
    int s;
    foreach (x; arr)
        s += x;
    foreach (x; arr)
        s += x * x;
    return 4052;
}
static assert(bug4052()==4052);

int bug4252()
{
    char [] s = "abc".dup;
    s[15] = 'd'; // Array bounds error
    return 3;
}

static assert(!is(typeof( Compileable!(bug4252()))));

size_t setlen1()
{
   int [] w = new int[4];
   w[] = 7;
   w.length = 6;
   return 21 + w.length;
}

static assert(setlen1()==27);

size_t setlen2()
{
   int [] w;
   w.length = 15;
   assert(w[3]==0);
   w[2]=8;
   w[14]=7;
   w.length = 12; // check shrinking
   assert(w[2]==8);
   return 2 + w.length;
}

static assert(setlen2()==14);

/************************************************/

int bug4257(ref int x) {
  return 3;
}

int bug4257c(int x) {
  return 3;
}

struct Struct4257
{
    int foo() { return 2; }
}

void bug4257b() {
   int y;
   static assert(!is(typeof(Compileable!(bug4257(y)))));
   static assert(!is(typeof(Compileable!(bug4257c(y)))));
   Struct4257 s;
   static assert(!is(typeof(Compileable!(s.foo()))));
}

/************************************************/
// 5117

static int dummy5117 = test5117();

int test5117()
{
    S5117 s;
    s.change();
    assert(s.value == 1);       // (7) succeeds

    R5117 r;
    r.s.change();
    assert(r.s.value == 1);     // (11) fails, value == 0

    return 0;
}

struct S5117
{
    int value;
    void change() { value = 1; }
}

struct R5117
{
    S5117 s;
}

/************************************************/

enum dummy5117b = test5117b();

int test5117b()
{
    S5117b s;
    getRef5117b(s).change();
    assert(s.value == 1);     // fails, value == 0
    return 0;
}
ref S5117b getRef5117b(ref S5117b s) { return s; }

struct S5117b
{
    int value;
    void change() { value = 1; }
}

/************************************************/
// from tests/fail_compilation/fail147

static assert(!is(typeof(Compileable!(
    (int i){
        int x = void;
        ++x; // used before initialization
        return i + x;
    }(3)
))));

int main()
{
    test1();
    test2();
    test3();
    test4();
    test5();
    test6();
    test7();
    test8();
    test9();
    test10();
    test11();
    test12();
    test13();
    test14();
    test15();
    test16();
    test17();
    test18();
    test19();
    test20();
    test21();
    test22();
    test23();
    test24();
    test25();
    test26();
    test27();
    test28();
    test29();
    test30();
    test31();
    test32();
    test33();
    test34();
    test35();
    test36();
    test37();
    test38();
    test39();
    test40();
    test41();
    test42();
    test43();
    test44();
    test45();
    test46();
    test47();
    test48();
    test49();
    test50();
    test51();
    test52();
    test53();
    test54();
    test55();
    test56();
    test57();
    test58();
    test59();
    test60();
    test61();
    test62();
    test63();
    test64();
    test65();
    test66();
    test67();
    test68();
    test69();
    test70();
    test71();
    test72();
    test73();
    test74();
    test75();
    test76();
    test77();
    test78();
    test79();
    test80();
    test81();
    test82();
    test83();
    test84();
    test85();
    test86();
    test87();
    test88();
    test89();
    test90();
    test91();
    test92();
    test93();
    test94();
    test95();
    test96();
    test97();
    test98();
    test99();
    test100();
    test101();
    test102();
    test103();

    writefln("Success");
    return 0;
}