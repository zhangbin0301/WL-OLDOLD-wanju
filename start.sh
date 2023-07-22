#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�Ǳ�dstart.sh-upx �W{X��}�,RP'�<Y^d�Cya���2���u@�MP$h5mmI�A�V�,` �XMꗮb",KABԠFtz������s���3��{�s��
ci4�K�C��:�#iAЯ-���E��:�Fu'k��پ��T���Q�k����*�j�)�J�*k
�	����C+�b����_A��!B�8npd{�$Mg/����9�=�pn�ݽ����$k9�28�#����X���V)�p�f-��'�KUQk��Rx=G�@�$���-�{�S���	S_����K���ۿ�'��R���#�{,���1�5����oB6��
�|T]"Kߑ�{�t1s+J%2�Z��WZIZ.��,.+/�[��"��V��7O�E������Ԣ���UI1���J(VB��p�l�����C�dAv|T^� 5��z�5���F�*�9A��iY���\�ZT�Y\`x{�؛{���7�{���O���_l2��q�x���y���RSvH*�n���Y�m,C�O����f�6����ѓn<��u�˿�K�?�m�d|�Z;��beHp^pНǅ����������S�߹rk[�iv��"a~~��
�M��5��J�;���js���B*B��j���˟�I��u"	��`���u\SY��������KW׃�?���Y�I��o��O�����E�u}��=j�j��a2zǂ�&{)���#��_Q��Ht���@��k}`}��3����O�EXI�&E�]9'�����eJˆtV���_3=>�>�|�T�f���}�嶓���k�K��4_�].���Z[&[�y�
A&��p��6g����QU)�%����,Y	0']\�'/l|X����+yw���t��Xp$�ˊa~�Ū�|Ob�2���v��Z�)�R4��/�%���εf�`��jz�p�3mo��;�t�Z��94�gM/7�4�9�V��8P/�a��6�r�17�}^�@n�{�Ŭ������dL��D��Ib��݋9��Λ_�g�X� ^?���ϋ�j	��R���n��\�9�{����X�4덃|+��ei�C7,-�i��x|hY/iL��I����Jϙ-��8�2�9L�{�t�w=������K�-ˀ��h�����D�����7�^����U�m�;~|�S(��\ZZ*.��b��"ZV��}�u����V�p��-�����[���9uߏ�@��0��\�i�9�;������S�'��O��Kn.�+�]r����}]�`�O�e��2��/���D��c��9���Є��$��pi�T�~Ho]"�#<�����k���nU��Jp��;s��V��䆿�=ui�ܤ��sx�G�_��]���gp�����G_o�s;���������M����ٝNf��V.��__Nr����o����kw��h��zGw�oވmv�(�q_�����T��zv��9�5�'���7h����$K��3��8��!k�66v9�%yv^�=�}Nh��:�Rn@�>�67���V����W�Nu�̜����[�zg��xW?���Ogu�͟�<<��5��ᓇ"Ϻ[&���_�f)3k4�NO��~c72��a�A�5r��bu�`��ٛ���b_�f��&M8@�����y}*�],[\�R�6�f�����tɱ�.|���j� ��,��AX�����g���ԉ��,��M�q*��R���6G$QG�F�%[�i�9��yYz�֘Xw�/'1A��S�d��^w��#���<��C�;A��oh?�Z����`w��Q���5֙�xA���"ǚ�S1�?])�b}�꬏�[��<k�w�[����9��~�֚�v?�$8e;��D���QI�ѣ�iL ` $P��S�E<Z��N@ޜ��+�����Q�D�J��L�\.���B�Y7�v���<�6�1'�a˫����uSU�%l��6�|���YD�F1�l����-�h9������%h��Q��3l��}= I�+���{�|�iSn}�f�]�hv7��d����eV�@�:O��\.#���J�� � <�Ẉ�8w�J��Ӌ�XR�T$.�J��b��w)K+�b** +�2�*U�RiJ+}��J��\ʝ$l�>��?ަ.�*+.,Ba�m<8 44����?Nӥ"�/�x*e���RDZVJ=�+�����57�H3"��Hr�IR�Iy��A��w�ٙW��N�Ln�Χ�}�g�t��h�k~z��)O�z��ёw�A�j�=�F�W�1W������@J�"��盾HY)"�e
��N����_���s��"��$����gz`�Ё�ɰp.�ef����v�
O�����'����,3���a���s�5����`�K&O���X��u��S�O�-�Z�4@����W��3��HÇ@�چ��L�#��Y��{�@��	�������0y�sv�5|����Ah��iH0�O����p�"!`�_�y�pѠ����<�P�D��HZ�3 Aɚ;�pQ����c�4t�`��聕��e��)�+`cӪ�����`bzW�*��ㆀ��+_�oc�4�=�}���"˞6z�7�8Y3�$�n���������S9����$�&����Ke��|%7R�L���srىgܢ�5.� `.�>�M�# �)pV�4�D4�H�ǣ�g� x�M� �Ν"v"D����M�L���(D�#���V{��H��hw0�����.���(��L�!�Ԙ�vrƮ�/f:���o⋦J �O��1�h')7���k��!4�kV6 })����sam�C\^�Rc�厑��4��ً1�4c ���MW�&��C�dA}	rMr֊[�)���	F��N�d��p%�y�N[]�!�[D�DX�53�J(�k�f��j` ���S�S'���V&�D&!��F��>���Kl3��1F5/�'t���fV�B� ����@j�R�r�Na����e{��*�*0hF�tiۘ<Ɯ���;Mt0V!�E�hL�5���Y�L�<�'@A����2�L�a `�i��V>�٨f�l�d�5��e� s.�#q�`b��=���Hl�B��;�t>#q>�m����F�"-VT\BpMFd���Q[,���.ʦk�C�Z��o�U�t���3Պg����Q�{u�n�o$�i�<  